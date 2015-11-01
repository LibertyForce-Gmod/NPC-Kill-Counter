local function NPCKillCounter( victim, killer, weapon )
	if GetConVar("npc_kill_counter_enabled"):GetBool() and IsValid( killer ) then
		-- Only in SinglePlayer: If Indirect Count is enabled, give "Player 1" points for all deaths but those caused by NPCs.
		if game.SinglePlayer() and not killer:IsNPC() and not killer:IsPlayer() and GetConVar("npc_kill_counter_indirect"):GetBool() then
			player.GetByID(1):AddFrags(1)
		-- Gives direct kills to the killer.
		elseif killer:IsPlayer() then
			killer:AddFrags(1)
		end
	end
end

hook.Add("OnNPCKilled","NPCKillCounter", NPCKillCounter)

CreateConVar( "npc_kill_counter_enabled", 1, FCVAR_ARCHIVE )
CreateConVar( "npc_kill_counter_indirect", 0, FCVAR_ARCHIVE )
