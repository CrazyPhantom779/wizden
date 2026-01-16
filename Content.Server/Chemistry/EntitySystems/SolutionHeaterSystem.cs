// SPDX-FileCopyrightText: 2023 0x6273 <0x40@keemail.me>
// SPDX-FileCopyrightText: 2023 ElectroJr <leonsfriedrich@gmail.com>
// SPDX-FileCopyrightText: 2023 TemporalOroboros <TemporalOroboros@gmail.com>
// SPDX-FileCopyrightText: 2023 Visne <39844191+Visne@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 12rabbits <53499656+12rabbits@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Alzore <140123969+Blackern5000@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 ArtisticRoomba <145879011+ArtisticRoomba@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Brandon Hu <103440971+Brandon-Huu@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Cojoke <83733158+Cojoke-dot@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Dimastra <65184747+Dimastra@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Dimastra <dimastra@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Ed <96445749+TheShuEd@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Emisse <99158783+Emisse@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Eoin Mcloughlin <helloworld@eoinrul.es>
// SPDX-FileCopyrightText: 2024 IProduceWidgets <107586145+IProduceWidgets@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 JIPDawg <51352440+JIPDawg@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 JIPDawg <JIPDawg93@gmail.com>
// SPDX-FileCopyrightText: 2024 Mervill <mervills.email@gmail.com>
// SPDX-FileCopyrightText: 2024 Moomoobeef <62638182+Moomoobeef@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Nemanja <98561806+EmoGarbage404@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 PJBot <pieterjan.briers+bot@gmail.com>
// SPDX-FileCopyrightText: 2024 Pieter-Jan Briers <pieterjan.briers+git@gmail.com>
// SPDX-FileCopyrightText: 2024 Pieter-Jan Briers <pieterjan.briers@gmail.com>
// SPDX-FileCopyrightText: 2024 Piras314 <p1r4s@proton.me>
// SPDX-FileCopyrightText: 2024 PopGamer46 <yt1popgamer@gmail.com>
// SPDX-FileCopyrightText: 2024 PursuitInAshes <pursuitinashes@gmail.com>
// SPDX-FileCopyrightText: 2024 QueerNB <176353696+QueerNB@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Saphire Lattice <lattice@saphi.re>
// SPDX-FileCopyrightText: 2024 ShadowCommander <10494922+ShadowCommander@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Simon <63975668+Simyon264@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Spessmann <156740760+Spessmann@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Thomas <87614336+Aeshus@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 Winkarst <74284083+Winkarst-cpu@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 deltanedas <39013340+deltanedas@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 deltanedas <@deltanedas:kde.org>
// SPDX-FileCopyrightText: 2024 eoineoineoin <github@eoinrul.es>
// SPDX-FileCopyrightText: 2024 github-actions[bot] <41898282+github-actions[bot]@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 lzk <124214523+lzk228@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 metalgearsloth <31366439+metalgearsloth@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 slarticodefast <161409025+slarticodefast@users.noreply.github.com>
// SPDX-FileCopyrightText: 2024 stellar-novas <stellar_novas@riseup.net>
// SPDX-FileCopyrightText: 2024 themias <89101928+themias@users.noreply.github.com>
// SPDX-FileCopyrightText: 2025 Aiden <28298836+Aidenkrz@users.noreply.github.com>
//
// SPDX-License-Identifier: AGPL-3.0-or-later

using Content.Server.Chemistry.Components;
using Content.Server.Power.EntitySystems;
using Content.Shared.Chemistry.EntitySystems;
using Content.Shared.Chemistry;
using Content.Shared.Chemistry.Components.SolutionManager;
using Content.Shared.Placeable;
using Content.Shared.Hands;
using Content.Shared.Hands.Components;
using Content.Shared.Hands.EntitySystems;
using Content.Shared.Power;
using Content.Server.Chemistry.Containers.EntitySystems;
using Content.Server.Hands.Systems;
using Content.Shared._TP.Jellids;
using Content.Shared.Inventory;
using Content.Shared.Tag;
using Robust.Shared.Prototypes;

namespace Content.Server.Chemistry.EntitySystems
{
    public sealed class SolutionHeaterSystem : EntitySystem
    {
        [Dependency] private readonly PowerReceiverSystem _powerReceiver = default!;
        [Dependency] private readonly SharedAppearanceSystem _appearance = default!;
        [Dependency] private readonly SharedSolutionContainerSystem _solutionContainer = default!;
        [Dependency] private readonly HandsSystem _hands = default!;
        [Dependency] private readonly InventorySystem _inventory = default!;
        [Dependency] private readonly TagSystem _tag = default!;

        /// <inheritdoc/>
        public override void Initialize()
        {
            base.Initialize();

            SubscribeLocalEvent<SolutionHeaterComponent, PowerChangedEvent>(OnPowerChanged);
            SubscribeLocalEvent<SolutionHeaterComponent, ItemPlacedEvent>(OnItemPlaced);
            SubscribeLocalEvent<SolutionHeaterComponent, ItemRemovedEvent>(OnItemRemoved);
        }

        private void TurnOn(EntityUid uid)
        {
            _appearance.SetData(uid, SolutionHeaterVisuals.IsOn, true);
            EnsureComp<ActiveSolutionHeaterComponent>(uid);
        }

        public bool TryTurnOn(EntityUid uid, ItemPlacerComponent? placer = null)
        {
            if (!Resolve(uid, ref placer))
                return false;

            if (placer.PlacedEntities.Count <= 0 || !_powerReceiver.IsPowered(uid))
                return false;

            TurnOn(uid);
            return true;
        }

        public void TurnOff(EntityUid uid)
        {
            _appearance.SetData(uid, SolutionHeaterVisuals.IsOn, false);
            RemComp<ActiveSolutionHeaterComponent>(uid);
        }

        private void OnPowerChanged(Entity<SolutionHeaterComponent> entity, ref PowerChangedEvent args)
        {
            var placer = Comp<ItemPlacerComponent>(entity);
            if (args.Powered && placer.PlacedEntities.Count > 0)
            {
                TurnOn(entity);
            }
            else
            {
                TurnOff(entity);
            }
        }

        private void OnItemPlaced(Entity<SolutionHeaterComponent> entity, ref ItemPlacedEvent args)
        {
            TryTurnOn(entity);
        }

        private void OnItemRemoved(Entity<SolutionHeaterComponent> entity, ref ItemRemovedEvent args)
        {
            var placer = Comp<ItemPlacerComponent>(entity);
            if (placer.PlacedEntities.Count == 0) // Last entity was removed
                TurnOff(entity);
        }

        private static readonly ProtoId<TagPrototype> FireproofTag = "PreventsFire";

        public override void Update(float frameTime)
        {
            base.Update(frameTime);

            // Define energy variable that will be reused

            // First, check for placed entities and heat their solutions.
            var query = EntityQueryEnumerator<ActiveSolutionHeaterComponent, SolutionHeaterComponent, ItemPlacerComponent>();
            while (query.MoveNext(out _, out _, out var heater, out var placer))
            {
                foreach (var heatingEntity in placer.PlacedEntities)
                {
                    // Only heat solutions in containers that have the necessary component
                    if (!TryComp<SolutionContainerManagerComponent>(heatingEntity, out var container))
                        continue;

                    // Calculate energy based on the heater's heat rate
                    var energy = heater.HeatPerSecond * frameTime;

                    // Apply thermal energy to the solutions in the container
                    foreach (var (_, soln) in _solutionContainer.EnumerateSolutions((heatingEntity, container)))
                    {
                        _solutionContainer.AddThermalEnergy(soln, energy);
                    }
                }
            }

            // Now check for players holding valid items that need heating
            var playerQuery = EntityQueryEnumerator<HandsComponent>();
            while (playerQuery.MoveNext(out var playerUid, out var handsComponent))
            {

                if (!HasComp<JellidComponent>(playerUid))
                {
                    continue;
                }

                if (_inventory.TryGetSlotEntity(playerUid, "gloves", out var glovesUid))
                {
                    if (!HasComp<TagComponent>(glovesUid))
                    {
                        continue;
                    }

                    if (_tag.HasTag(glovesUid.Value, FireproofTag))
                    {
                        continue;
                    }
                }

                if (_hands.GetActiveItem(playerUid) is not { } heldItem)
                {
                    continue;
                }

                if (!TryComp<SolutionContainerManagerComponent>(heldItem, out var container))
                {
                    continue;
                }

                float energy2 = 0f;
                energy2 = 30f * frameTime; // God, forgive me for my hardcodedness

                foreach (var (_, soln) in _solutionContainer.EnumerateSolutions((heldItem, container)))
                {
                    _solutionContainer.AddThermalEnergy(soln, energy2);
                }
            }
        }
    }
}