// SPDX-FileCopyrightText: 2023 DrSmugleaf <DrSmugleaf@users.noreply.github.com>
// SPDX-FileCopyrightText: 2023 ShadowCommander <10494922+ShadowCommander@users.noreply.github.com>
// SPDX-FileCopyrightText: 2023 Slava0135 <40753025+Slava0135@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Aiden <aiden@djkraz.com>
// SPDX-FileCopyrightText: 2024 Ed <96445749+TheShuEd@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Nemanja <98561806+EmoGarbage404@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Piras314 <p1r4s@proton.me>
// SPDX-FileCopyrightText: 2024 deltanedas <39013340+deltanedas@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 deltanedas <@deltanedas:kde.org>
// SPDX-FileCopyrightText: 2024 metalgearsloth <31366439+metalgearsloth@users.noreply.github.com>
// SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

using Content.Server.StationEvents.Components;
using Content.Server.Traits.Assorted;
using Content.Shared.GameTicking.Components;
using Content.Shared.Humanoid;
using Content.Shared.Mind.Components;
using Content.Shared.Traits.Assorted;
using Robust.Shared.Map;
using Robust.Shared.Map.Components;
using Content.Shared.Random.Rules;
using Content.Server.Station.Components;
using Content.Shared.Station.Components;

namespace Content.Server.StationEvents.Events;

public sealed class MassHallucinationsRule : StationEventSystem<MassHallucinationsRuleComponent>
{
    [Dependency] private readonly ParacusiaSystem _paracusia = default!;
    [Dependency] private readonly IMapManager _mapManager = default!;

    protected override void Started(EntityUid uid, MassHallucinationsRuleComponent component, GameRuleComponent gameRule, GameRuleStartedEvent args)
{
    base.Started(uid, component, gameRule, args);
    var query = EntityQueryEnumerator<MindContainerComponent>();

    if (component.SweetwaterOnly)
    {
        // Get the mapId from the station (or another valid source for the map)
        if (TryComp<StationDataComponent>(uid, out var stationData))
        {
            foreach (var grid in stationData.Grids)
            {
                // Using the grid directly to get the MapId
                var mapId = Transform(grid).MapID;

                // Get all grids on that map
                foreach (var gridEntity in _mapManager.GetAllGrids(mapId))
                {
                    if (TryComp<SweetwaterComponent>(gridEntity.Owner, out var sweetwaterComp))
                    {
                        ApplyOceanSound(gridEntity.Owner, component);
                    }
                }
            }
        }
    }
    else
    {
        while (query.MoveNext(out var ent, out _))
        {
            if (!HasComp<ParacusiaComponent>(ent))
            {
                var paracusia = EnsureComp<ParacusiaComponent>(ent);
                _paracusia.SetSounds(ent, component.Sounds, paracusia);
                _paracusia.SetTime(ent, component.MinTimeBetweenIncidents, component.MaxTimeBetweenIncidents, paracusia);
                _paracusia.SetDistance(ent, component.MaxSoundDistance);
            }
        }
    }
}


    private void ApplyOceanSound(EntityUid map, MassHallucinationsRuleComponent component)
    {
        foreach (var ent in GetGridChildren(map))
        {
            if (HasComp<MindContainerComponent>(ent) && !HasComp<ParacusiaComponent>(ent))
            {
                var paracusia = EnsureComp<ParacusiaComponent>(ent);
                _paracusia.SetSounds(ent, component.Sounds, paracusia);
                _paracusia.SetTime(ent, component.MinTimeBetweenIncidents, component.MaxTimeBetweenIncidents, paracusia);
                _paracusia.SetDistance(ent, component.MaxSoundDistance);
            }
        }
    }

    private IEnumerable<EntityUid> GetGridChildren(EntityUid target)
    {
        if (TryComp<StationDataComponent>(target, out var station))
        {
            foreach (var grid in station.Grids)
            {
                var enumerator = Transform(grid).ChildEnumerator; // Non-generic Transform
                while (enumerator.MoveNext(out var ent))
                {
                    yield return ent;
                }
            }
        }
    }

    protected override void Ended(EntityUid uid, MassHallucinationsRuleComponent component, GameRuleComponent gameRule, GameRuleEndedEvent args)
    {
        base.Ended(uid, component, gameRule, args);

        foreach (var ent in component.AffectedEntities)
        {
            RemComp<ParacusiaComponent>(ent);
        }

        component.AffectedEntities.Clear();
    }
}