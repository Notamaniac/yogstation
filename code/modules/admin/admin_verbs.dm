//admin verb groups - They can overlap if you so wish. Only one of each verb will exist in the verbs list regardless
var/list/admin_verbs_default = list(
	/client/proc/toggleadminhelpsound,	/*toggles whether we hear a sound when adminhelps/PMs are used*/
	/client/proc/deadmin_self,			/*destroys our own admin datum so we can play as a regular player*/
	/client/proc/cmd_admin_say,			/*admin-only ooc chat*/
	/client/proc/hide_verbs,			/*hides all our adminverbs*/
	/client/proc/hide_most_verbs,		/*hides all our hideable adminverbs*/
	/client/proc/debug_variables,		/*allows us to -see- the variables of any instance in the game. +VAREDIT needed to modify*/
	/client/proc/admin_memo,			/*admin memo system. show/delete/write. +SERVER needed to delete admin memos of others*/
	/client/proc/deadchat,				/*toggles deadchat on/off*/
	/client/proc/dsay,					/*talk in deadchat using our ckey/fakekey*/
	/client/proc/toggleprayers,			/*toggles prayers on/off*/
	/client/verb/toggleprayersounds,	/*Toggles prayer sounds (HALLELUJAH!)*/
	/client/proc/toggle_hear_radio,		/*toggles whether we hear the radio*/
	/client/proc/investigate_show,		/*various admintools for investigation. Such as a singulo grief-log*/
	/client/proc/secrets,
	/client/proc/reload_admins,
	/client/proc/adminwhotoggle,
	/client/proc/adminwho,
	/client/proc/donor_ooc_admin,
	/client/proc/reestablish_db_connection,/*reattempt a connection to the database*/
	/client/proc/cmd_admin_pm_context,	/*right-click adminPM interface*/
	/client/proc/cmd_admin_pm_panel,		/*admin-pm list*/
	/client/proc/view_tickets,
	/client/proc/toggleticketlistenall,
	/client/proc/reload_donators,
	/client/proc/user_stats,
	/client/proc/stop_sounds
	)
var/list/admin_verbs_admin = list(
	/client/proc/player_panel_new,		/*shows an interface for all players, with links to various panels*/
	/client/proc/invisimin,				/*allows our mob to go invisible/visible*/
//	/datum/admins/proc/show_traitor_panel,	/*interface which shows a mob's mind*/ -Removed due to rare practical use. Moved to debug verbs ~Errorage
	/datum/admins/proc/show_player_panel,	/*shows an interface for individual players, with various links (links require additional flags*/
	/client/proc/game_panel,			/*game panel, allows to change game-mode etc*/
	/client/proc/check_ai_laws,			/*shows AI and borg laws*/
	/datum/admins/proc/toggleooc,		/*toggles ooc on/off for everyone*/
	/datum/admins/proc/toggleoocdead,	/*toggles ooc on/off for everyone who is dead*/
	/datum/admins/proc/toggleenter,		/*toggles whether people can join the current game*/
	/datum/admins/proc/toggleguests,	/*toggles whether guests can join the current game*/
	/datum/admins/proc/announce,		/*priority announce something to all clients.*/
	/datum/admins/proc/set_admin_notice,/*announcement all clients see when joining the server.*/
	/client/proc/admin_ghost,			/*allows us to ghost/reenter body at will*/
	/client/proc/toggle_view_range,		/*changes how far we can see*/
	/datum/admins/proc/view_txt_log,	/*shows the server log (diary) for today*/
	/datum/admins/proc/view_atk_log,
	/datum/admins/proc/view_admin_log,	/*shows the server combat-log, doesn't do anything presently*/
	/client/proc/cmd_admin_subtle_message,	/*send an message to somebody as a 'voice in their head'*/
	/client/proc/cmd_admin_delete,		/*delete an instance/object/mob/etc*/
	/client/proc/cmd_admin_check_contents,	/*displays the contents of an instance*/
	/client/proc/check_antagonists,		/*shows all antags*/
	/datum/admins/proc/access_news_network,	/*allows access of newscasters*/
	/client/proc/giveruntimelog,		/*allows us to give access to runtime logs to somebody*/
	/client/proc/getruntimelog,			/*allows us to access runtime logs to somebody*/
	/client/proc/getserverlog,			/*allows us to fetch server logs (diary) for other days*/
	/client/proc/jumptocoord,			/*we ghost and jump to a coordinate*/
	/client/proc/Getmob,				/*teleports a mob to our location*/
	/client/proc/Getkey,				/*teleports a mob with a certain ckey to our location*/
//	/client/proc/sendmob,				/*sends a mob somewhere*/ -Removed due to it needing two sorting procs to work, which were executed every time an admin right-clicked. ~Errorage
	/client/proc/jumptoarea,
	/client/proc/jumptokey,				/*allows us to jump to the location of a mob with a certain ckey*/
	/client/proc/jumptomob,				/*allows us to jump to a specific mob*/
	/client/proc/jumptoturf,			/*allows us to jump to a specific turf*/
	/client/proc/admin_call_shuttle,	/*allows us to call the emergency shuttle*/
	/client/proc/admin_cancel_shuttle,	/*allows us to cancel the emergency shuttle, sending it back to centcom*/
	/client/proc/cmd_admin_direct_narrate,	/*send text directly to a player with no padding. Useful for narratives and fluff-text*/
	/client/proc/cmd_admin_world_narrate,	/*sends text to all players with no padding*/
	/client/proc/cmd_admin_local_narrate,	//sends text to all mobs within view of atmo
	/client/proc/cmd_admin_create_faction_announcements,
	/client/proc/list_pretty_filters,
	/client/proc/test_pretty_filters,
	/client/proc/add_pretty_filter,
	/client/proc/reset_pretty_filter,
	/client/proc/admin_credits_get,
	/client/proc/admin_credits_list,
	/client/proc/admin_credits_spend,
	/client/proc/admin_credits_earn,
	/client/proc/admin_credits_set,
	/client/proc/check_words,			/*displays cult-words*/
	/client/proc/reset_all_tcs,		/*resets all telecomms scripts*/
	/datum/admins/proc/cybermen_panel,  //lots of cybermen options
	/client/proc/toggle_restart_vote,	//moderator tool for toggling restart vote
	/datum/admins/proc/toggle_high_risk_item_notifications //toggles notifying admins when objective items are destroyed or change z-levels
	)
var/list/admin_verbs_ban = list(
	/client/proc/unban_panel,
	/client/proc/jobbans,
	/client/proc/unjobban_panel,
	/client/proc/DB_ban_panel
	)
var/list/admin_verbs_sounds = list(
	/client/proc/play_local_sound,
	/client/proc/play_sound,
	/client/proc/set_round_end_sound,
	)
var/list/admin_verbs_fun = list(
	/client/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/cinematic,
	/client/proc/one_click_antag,
	/client/proc/send_space_ninja,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/object_say,
	/client/proc/toggle_random_events,
	/client/proc/set_ooc,
	/client/proc/reset_ooc,
	/client/proc/forceEvent,
	/client/proc/bluespace_artillery,
	/client/proc/admin_change_sec_level,
	/client/proc/toggle_nuke,
	/client/proc/rejuv_all
	)
var/list/admin_verbs_spawn = list(
	/datum/admins/proc/spawn_atom,		/*allows us to spawn instances*/
	/client/proc/respawn_character
	)
var/list/admin_verbs_server = list(
	/client/proc/lag_fixer,
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/end_round,
	/datum/admins/proc/delay,
	/datum/admins/proc/toggleaban,
	/client/proc/toggle_log_hrefs,
	/client/proc/everyone_random,
	/datum/admins/proc/toggleAI,
	/client/proc/cmd_admin_delete,		/*delete an instance/object/mob/etc*/
	/client/proc/cmd_debug_del_all,
	/client/proc/toggle_random_events,
	/client/proc/fix_air,
	/client/proc/panicbunker
	)
var/list/admin_verbs_debug = list(
	/client/proc/restart_controller,
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/Debug2,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/debug_controller,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_admin_delete,
	/client/proc/cmd_debug_del_all,
	/client/proc/restart_controller,
	/client/proc/enable_debug_verbs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/SDQL2_query,
	/client/proc/test_movable_UI,
	/client/proc/test_snap_UI,
	/client/proc/debugNatureMapGenerator,
	/client/proc/check_bomb_impacts,
	/proc/machine_upgrade,
	/client/proc/populate_world,
	/client/proc/cmd_display_del_log,
	/client/proc/reset_latejoin_spawns
	)
var/list/admin_verbs_possess = list(
	/proc/possess,
	/proc/release
	)
var/list/admin_verbs_permissions = list(
	/client/proc/edit_admin_permissions,
	/client/proc/admin_credits_get,
	/client/proc/admin_credits_list,
	/client/proc/admin_credits_spend,
	/client/proc/admin_credits_earn,
	/client/proc/admin_credits_set
	)
var/list/admin_verbs_rejuv = list(
	/client/proc/respawn_character
	)

//verbs which can be hidden - needs work
var/list/admin_verbs_hideable = list(
	/client/proc/set_ooc,
	/client/proc/reset_ooc,
	/client/proc/deadmin_self,
	/client/proc/deadchat,
	/client/proc/toggleprayers,
	/client/proc/toggle_hear_radio,
	/datum/admins/proc/show_traitor_panel,
	/datum/admins/proc/toggleenter,
	/datum/admins/proc/toggleguests,
	/datum/admins/proc/announce,
	/datum/admins/proc/set_admin_notice,
	/client/proc/admin_ghost,
	/client/proc/toggle_view_range,
	/datum/admins/proc/view_txt_log,
	/datum/admins/proc/view_atk_log,
	/datum/admins/proc/view_admin_log,
	/client/proc/cmd_admin_subtle_message,
	/client/proc/cmd_admin_check_contents,
	/datum/admins/proc/access_news_network,
	/client/proc/admin_call_shuttle,
	/client/proc/admin_cancel_shuttle,
	/client/proc/cmd_admin_direct_narrate,
	/client/proc/cmd_admin_world_narrate,
	/client/proc/cmd_admin_local_narrate,
	/client/proc/check_words,
	/client/proc/play_local_sound,
	/client/proc/play_sound,
	/client/proc/set_round_end_sound,
	/client/proc/cmd_admin_dress,
	/client/proc/cmd_admin_gib_self,
	/client/proc/drop_bomb,
	/client/proc/cinematic,
	/client/proc/send_space_ninja,
	/client/proc/cmd_admin_add_freeform_ai_law,
	/client/proc/cmd_admin_add_random_ai_law,
	/client/proc/cmd_admin_create_faction_announcements,
	/client/proc/object_say,
	/client/proc/toggle_random_events,
	/client/proc/cmd_admin_add_random_ai_law,
	/datum/admins/proc/startnow,
	/datum/admins/proc/restart,
	/datum/admins/proc/delay,
	/datum/admins/proc/toggleaban,
	/client/proc/toggle_log_hrefs,
	/client/proc/everyone_random,
	/datum/admins/proc/toggleAI,
	/client/proc/restart_controller,
	/client/proc/cmd_admin_list_open_jobs,
	/client/proc/callproc,
	/client/proc/callproc_datum,
	/client/proc/Debug2,
	/client/proc/reload_admins,
	/client/proc/reload_donators,
	/client/proc/cmd_debug_make_powernets,
	/client/proc/debug_controller,
	/client/proc/startSinglo,
	/client/proc/cmd_debug_mob_lists,
	/client/proc/cmd_debug_del_all,
	/client/proc/enable_debug_verbs,
	/client/proc/list_pretty_filters,
	/client/proc/test_pretty_filters,
	/client/proc/add_pretty_filter,
	/proc/possess,
	/proc/release,
	/client/proc/reload_admins,
	/client/proc/reset_all_tcs,
	/client/proc/panicbunker,
	/client/proc/admin_change_sec_level,
	/client/proc/toggle_nuke,
	/client/proc/cmd_display_del_log,
	/datum/admins/proc/toggle_high_risk_item_notifications
	)

/client/proc/add_admin_verbs()
	if(holder)
		control_freak = CONTROL_FREAK_SKIN | CONTROL_FREAK_MACROS

		var/rights = holder.rank.rights
		verbs += admin_verbs_default
		#ifdef CYBERMEN_DEBUG
		verbs += cybermen_debug_abilities
		#endif
		if(rights & R_BUILDMODE)	verbs += /client/proc/togglebuildmodeself
		if(rights & R_ADMIN)		verbs += admin_verbs_admin
		if(rights & R_BAN)			verbs += admin_verbs_ban
		if(rights & R_FUN)			verbs += admin_verbs_fun
		if(rights & R_SERVER)		verbs += admin_verbs_server
		if(rights & R_DEBUG)		verbs += admin_verbs_debug
		if(rights & R_POSSESS)		verbs += admin_verbs_possess
		if(rights & R_PERMISSIONS)	verbs += admin_verbs_permissions
		if(rights & R_STEALTH)		verbs += /client/proc/stealth
		if(rights & R_REJUVINATE)	verbs += admin_verbs_rejuv
		if(rights & R_SOUNDS)		verbs += admin_verbs_sounds
		if(rights & R_SPAWN)		verbs += admin_verbs_spawn

		for(var/path in holder.rank.adds)
			verbs += path
		for(var/path in holder.rank.subs)
			verbs -= path

/client/proc/remove_admin_verbs()
	verbs.Remove(
		admin_verbs_default,
		/client/proc/togglebuildmodeself,
		admin_verbs_admin,
		admin_verbs_ban,
		admin_verbs_fun,
		admin_verbs_server,
		admin_verbs_debug,
		admin_verbs_possess,
		admin_verbs_permissions,
		/client/proc/stealth,
		admin_verbs_rejuv,
		admin_verbs_sounds,
		admin_verbs_spawn,
		/*Debug verbs added by "show debug verbs"*/
		/client/proc/Cell,
		/client/proc/do_not_use_these,
		/client/proc/camera_view,
		/client/proc/sec_camera_report,
		/client/proc/intercom_view,
		/client/proc/air_status,
		/client/proc/atmosscan,
		/client/proc/powerdebug,
		/client/proc/count_objects_on_z_level,
		/client/proc/count_objects_all,
		/client/proc/cmd_assume_direct_control,
		/client/proc/startSinglo,
		/client/proc/fps,
		/client/proc/cmd_admin_grantfullaccess,
		/client/proc/cmd_admin_areatest,
		/mob/dead/observer/proc/toggleninjahud,
		/client/proc/readmin
		)
	if(holder)
		verbs.Remove(holder.rank.adds)

/client/proc/hide_most_verbs()//Allows you to keep some functionality while hiding some verbs
	set name = "Adminverbs - Hide Most"
	set category = "Admin"

	verbs.Remove(/client/proc/hide_most_verbs, admin_verbs_hideable)
	verbs += /client/proc/show_verbs

	src << "<span class='interface'>Most of your adminverbs have been hidden.</span>"
	feedback_add_details("admin_verb","HMV") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/hide_verbs()
	set name = "Adminverbs - Hide All"
	set category = "Admin"

	remove_admin_verbs()
	verbs += /client/proc/show_verbs

	src << "<span class='interface'>Almost all of your adminverbs have been hidden.</span>"
	feedback_add_details("admin_verb","TAVVH") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/show_verbs()
	set name = "Adminverbs - Show"
	set category = "Admin"

	verbs -= /client/proc/show_verbs
	add_admin_verbs()

	src << "<span class='interface'>All of your adminverbs are now visible.</span>"
	feedback_add_details("admin_verb","TAVVS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/admin_credits_get(mob/M as mob)
	set category = "Special Verbs"
	set name = "Credits Show"

	if(!holder)
		return

	if(!get_client(M))
		src << "Error: The mob requires a client"
		return

	log_admin("CREDITS [get_ckey(src)] accessed the credits count for [get_ckey(M)]")
	src << "[get_ckey(M)] has [credits_reload_from_db(M)] credits"

/client/proc/admin_credits_list(var/total as num)
	set category = "Special Verbs"
	set name = "Credits Top List"

	if(!holder)
		return

	src << "Top [total] players by credits:"

	var/list/L = credits_top(total)
	for(var/datum/credit/C in L)
		src << " * [C.ckey] = [num2text(C.credits)]"

/client/proc/admin_credits_spend(mob/M as mob, var/credits as num)
	set category = "Special Verbs"
	set name = "Credits Spend"

	if(!holder)
		return

	if(!get_client(M))
		src << "Error: The mob requires a client"
		return

	var/result = credits_spend(M, credits)
	if(result >= 0)
		var/msg = "CREDITS [get_ckey(src)] decreased the credits for [get_ckey(M)] by [credits]"
		log_admin(msg)
		for(var/client/X in admins)
			X << "<span class='adminnotice'><b><font color=red>[msg]</font></b></span>"
		src << "[get_ckey(M)] now has [result] credits ([credits] spent)"
	else
		src << "Error giving credits: [result]"

/client/proc/admin_credits_earn(mob/M as mob, var/credits as num)
	set category = "Special Verbs"
	set name = "Credits Earn"

	if(!holder)
		return

	if(!get_client(M))
		src << "Error: The mob requires a client"
		return

	var/result = credits_earn(M, credits)
	if(result >= 0)
		var/msg = "CREDITS [get_ckey(src)] increased the credits for [get_ckey(M)] by [credits]"
		log_admin(msg)
		for(var/client/X in admins)
			X << "<span class='adminnotice'><b><font color=red>[msg]</font></b></span>"
		src << "[get_ckey(M)] now has [result] credits ([credits] received)"
	else
		src << "Error giving credits: [result]"

/client/proc/admin_credits_set(mob/M as mob, var/credits as num)
	set category = "Special Verbs"
	set name = "Credits Set"

	if(!holder)
		return

	if(!get_client(M))
		src << "Error: The mob requires a client"
		return

	var/result = credits_set(M, credits)
	if(result == QUERY_OK)
		var/msg = "CREDITS [get_ckey(src)] set the credits for [get_ckey(M)] to [credits]"
		log_admin(msg)
		for(var/client/X in admins)
			X << "<span class='adminnotice'><b><font color=red>[msg]</font></b></span>"
		src << "[get_ckey(M)] now has [credits] credits"
	else
		src << "Error giving credits: [result]"

/client/proc/admin_ghost()
	set category = "Admin"
	set name = "Aghost"
	if(!holder)	return
	if(istype(mob,/mob/dead/observer))
		//re-enter
		var/mob/dead/observer/ghost = mob
		ghost.can_reenter_corpse = 1			//just in-case.
		ghost.reenter_corpse()
		log_admin("[key_name(usr)] has used aghost to return to their body.")
		feedback_add_details("admin_verb","P") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	else if(istype(mob,/mob/new_player))
		src << "<font color='red'>Error: Aghost: Can't admin-ghost whilst in the lobby. Join or Observe first.</font>"
	else
		//ghostize
		var/mob/body = mob
		body.ghostize(1)
		if(body && !body.key)
			body.key = "@[key]"	//Haaaaaaaack. But the people have spoken. If it breaks; blame adminbus
		log_admin("[key_name(usr)] has used aghost to leave their body.")
		feedback_add_details("admin_verb","O") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!


/client/proc/invisimin()
	set name = "Invisimin"
	set category = "Admin"
	set desc = "Toggles ghost-like invisibility (Don't abuse this)"
	if(holder && mob)
		if(mob.invisibility == INVISIBILITY_OBSERVER)
			mob.invisibility = initial(mob.invisibility)
			mob << "<span class='boldannounce'>Invisimin off. Invisibility reset.</span>"
		else
			mob.invisibility = INVISIBILITY_OBSERVER
			mob << "<span class='adminnotice'><b>Invisimin on. You are now as invisible as a ghost.</b></span>"

/client/proc/lag_fixer(var/fix in list("Cancel", "Toggle Air", "Low FPS", "Normal FPS", "High FPS"))
	set name = "YogLag Fix"
	set category = "Server"
	set desc = "Tools to fix lag"

	if(!holder)
		return

	var/msg = ""

	if(fix == "Toggle Air")
		SSair.can_fire = SSair.can_fire == 1 ? 0 : 1
		src << "<span class='adminnotice'><b>Air has been [SSair.can_fire ? "started" : "stopped"].</b></span>"
		msg = "[key_name(src)] has [SSair.can_fire ? "started" : "stopped"] the air subsystem."
	else if(fix == "Low FPS")
		config.Tickcomp = 1
		world.fps = 11
		msg = "[key_name(src)] has modified world.fps to [world.fps] and config.Tickcomp to [config.Tickcomp]"
	else if(fix == "Normal FPS")
		config.Tickcomp = 1
		world.fps = 16
		msg = "[key_name(src)] has modified world.fps to [world.fps] and config.Tickcomp to [config.Tickcomp]"
	else if(fix == "High FPS")
		config.Tickcomp = 0
		world.fps = 20
		msg = "[key_name(src)] has modified world.fps to [world.fps] and config.Tickcomp to [config.Tickcomp]"

	log_admin(msg, 0)
	message_admins(msg, 0)

/client/proc/user_stats()
	set name = "User stats"
	set category = "Admin"
	set desc = "Shows basic user statistics"
	if(holder)
		var/isLobby = 0
		var/isDead = 0
		var/isUnconcious = 0
		var/isConcious = 0
		var/isCritical = 0

		var/isBlind = 0
		var/isMute = 0
		var/isDeaf = 0
		var/isNearsighted = 0
		var/isFat = 0
		var/isHusk = 0
		var/isNoClone = 0
		var/isClumsy = 0
		var/isZombie = 0
		var/isInfected = 0

		for(var/mob/M in player_list)
			if(istype(M, /mob/new_player))
				isLobby++
			else if(M.stat == DEAD)
				isDead++
			else if(M.stat == UNCONSCIOUS)
				isUnconcious++
			else if(M.stat == CONSCIOUS)
				isConcious++
			else if(istype(M, /mob/living))
				var/mob/living/L = M
				if(L.InCritical())
					isCritical++

			if(M.disabilities & BLIND)
				isBlind++
			if(M.disabilities & MUTE)
				isMute++
			if(M.disabilities & DEAF)
				isDeaf++
			if(M.disabilities & NEARSIGHT)
				isNearsighted++
			if(M.disabilities & FAT)
				isFat++
			if(M.disabilities & HUSK)
				isHusk++
			if(M.disabilities & NOCLONE)
				isNoClone++
			if(M.disabilities & CLUMSY)
				isClumsy++
			if(is_zombie(M))
				isZombie++
			if(is_infected(M))
				isInfected++

		src << "<span class='boldannounce'>Player statistics</span>"
		src << "<b>Statuses</b>"
		src << "� Lobby: [isLobby]\t\t([((isLobby / player_list.len) * 100)]%)"
		src << "� Concious: [isConcious]\t\t([((isConcious / player_list.len) * 100)]%)"
		src << "� Dead: [isDead]\t\t([((isDead / player_list.len) * 100)]%)"
		src << "� Unconcious: [isUnconcious]\t([((isUnconcious / player_list.len) * 100)]%)"
		src << "� Critical: [isCritical]\t\t([((isCritical / player_list.len) * 100)]%)"
		src << "<b>Disabilities</b>"
		src << "� Blind: [isBlind]\t\t([((isBlind / player_list.len) * 100)]%)"
		src << "� Mute: [isMute]\t\t([((isMute / player_list.len) * 100)]%)"
		src << "� Deaf: [isDeaf]\t\t([((isDeaf / player_list.len) * 100)]%)"
		src << "� Near Sighted: [isNearsighted]\t([((isNearsighted / player_list.len) * 100)]%)"
		src << "� Fat: [isFat]\t\t([((isFat / player_list.len) * 100)]%)"
		src << "� Husk: [isHusk]\t\t([((isHusk / player_list.len) * 100)]%)"
		src << "� No Clone: [isNoClone]\t\t([((isNoClone / player_list.len) * 100)]%)"
		src << "� Clumsy: [isClumsy]\t\t([((isClumsy / player_list.len) * 100)]%)"
		src << "<b>Game Modes</b>"
		src << "� Zombie: [isZombie]\t\t([((isZombie / player_list.len) * 100)]%)"
		src << "� Rage Infected: [isInfected]\t([((isInfected / player_list.len) * 100)]%)"
		src << " "

	feedback_add_details("admin_verb","UST") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/player_panel_new()
	set name = "Player Panel"
	set category = "Admin"
	if(holder)
		holder.player_panel_new()
	feedback_add_details("admin_verb","PPN") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/check_antagonists()
	set name = "Check Antagonists"
	set category = "Admin"
	if(holder)
		holder.check_antagonists()
		log_admin("[key_name(usr)] checked antagonists.")	//for tsar~
	feedback_add_details("admin_verb","CHA") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/jobbans()
	set name = "Display Job bans"
	set category = "Admin"
	if(holder)
		if(config.ban_legacy_system)
			holder.Jobbans()
		else
			holder.DB_ban_panel()
	feedback_add_details("admin_verb","VJB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/unban_panel()
	set name = "Unban Panel"
	set category = "Admin"
	if(holder)
		if(config.ban_legacy_system)
			holder.unbanpanel()
		else
			holder.DB_ban_panel()
	feedback_add_details("admin_verb","UBP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/game_panel()
	set name = "Game Panel"
	set category = "Admin"
	if(holder)
		holder.Game()
	feedback_add_details("admin_verb","GP") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return

/client/proc/secrets()
	set name = "Secrets"
	set category = "Admin"
	if (holder)
		holder.Secrets()
	feedback_add_details("admin_verb","S") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	return


/client/proc/findStealthKey(txt)
	if(txt)
		for(var/P in stealthminID)
			if(stealthminID[P] == txt)
				return P
	txt = stealthminID[ckey]
	return txt

/client/proc/createStealthKey()
	var/num = (rand(0,1000))
	var/i = 0
	while(i == 0)
		i = 1
		for(var/P in stealthminID)
			if(num == stealthminID[P])
				num++
				i = 0
	stealthminID["[ckey]"] = "@[num2text(num)]"

/client/proc/stealth()
	set category = "Admin"
	set name = "Stealth Mode"
	if(holder)
		if(holder.fakekey)
			holder.fakekey = null
		else
			var/new_key = ckeyEx(input("Enter your desired display name.", "Fake Key", key) as text|null)
			if(!new_key)	return
			if(length(new_key) >= 26)
				new_key = copytext(new_key, 1, 26)
			holder.fakekey = new_key
			createStealthKey()
		log_admin("[key_name(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]")
		message_admins("[key_name_admin(usr)] has turned stealth mode [holder.fakekey ? "ON" : "OFF"]")
	feedback_add_details("admin_verb","SM") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/drop_bomb()
	set category = "Special Verbs"
	set name = "Drop Bomb"
	set desc = "Cause an explosion of varying strength at your location."

	var/turf/epicenter = mob.loc
	var/list/choices = list("Small Bomb", "Medium Bomb", "Big Bomb", "Custom Bomb")
	var/choice = input("What size explosion would you like to produce?") in choices
	switch(choice)
		if(null)
			return 0
		if("Small Bomb")
			explosion(epicenter, 1, 2, 3, 3)
		if("Medium Bomb")
			explosion(epicenter, 2, 3, 4, 4)
		if("Big Bomb")
			explosion(epicenter, 3, 5, 7, 5)
		if("Custom Bomb")
			var/devastation_range = input("Devastation range (in tiles):") as null|num
			if(devastation_range == null)
				return
			var/heavy_impact_range = input("Heavy impact range (in tiles):") as null|num
			if(heavy_impact_range == null)
				return
			var/light_impact_range = input("Light impact range (in tiles):") as null|num
			if(light_impact_range == null)
				return
			var/flash_range = input("Flash range (in tiles):") as null|num
			if(flash_range == null)
				return
			explosion(epicenter, devastation_range, heavy_impact_range, light_impact_range, flash_range)
	message_admins("<span class='adminnotice'>[ckey] creating an admin explosion at [epicenter.loc].</span>")
	feedback_add_details("admin_verb","DB") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/give_spell(mob/T in mob_list)
	set category = "Fun"
	set name = "Give Spell"
	set desc = "Gives a spell to a mob."

	var/list/spell_list = list()
	var/type_length = length("/obj/effect/proc_holder/spell") + 2
	for(var/A in spells)
		spell_list[copytext("[A]", type_length)] = A
	var/obj/effect/proc_holder/spell/S = input("Choose the spell to give to that guy", "ABRAKADABRA") as null|anything in spell_list
	if(!S)
		return
	S = spell_list[S]
	feedback_add_details("admin_verb","GS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the spell [S].")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] gave [key_name(T)] the spell [S].</span>")
	if(T.mind)
		T.mind.AddSpell(new S)
	else
		T.AddSpell(new S)
		message_admins("<span class='danger'>Spells given to mindless mobs will not be transferred in mindswap or cloning!</span>")


/client/proc/give_disease(mob/T in mob_list)
	set category = "Fun"
	set name = "Give Disease"
	set desc = "Gives a Disease to a mob."
	var/datum/disease/D = input("Choose the disease to give to that guy", "ACHOO") as null|anything in diseases
	if(!D) return
	T.ForceContractDisease(new D)
	feedback_add_details("admin_verb","GD") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	log_admin("[key_name(usr)] gave [key_name(T)] the disease [D].")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] gave [key_name(T)] the disease [D].</span>")

/client/proc/object_say(obj/O in world)
	set category = "Special Verbs"
	set name = "OSay"
	set desc = "Makes an object say something."
	var/message = input(usr, "What do you want the message to be?", "Make Sound") as text | null
	if(!message)
		return
	var/templanguages = O.languages_spoken
	O.languages_spoken |= ALL
	O.say(message)
	O.languages_spoken = templanguages
	log_admin("[key_name(usr)] made [O] at [O.x], [O.y], [O.z] say \"[message]\"")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] made [O]([O.x], [O.y], [O.z])<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[O.x];Y=[O.y];Z=[O.z]'>(JMP)</a> say \"[message]\"</span>")
	feedback_add_details("admin_verb","OS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
/client/proc/togglebuildmodeself()
	set name = "Toggle Build Mode Self"
	set category = "Special Verbs"
	if(src.mob)
		togglebuildmode(src.mob)
	feedback_add_details("admin_verb","TBMS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/deadmin_self()
	set name = "De-admin self"
	set category = "Admin"

	if(holder)
		if(alert("Confirm self-deadmin for the round? You can't re-admin yourself without someont promoting you.",,"Yes","No") == "Yes")
			log_admin("[src] deadmined themself.")
			message_admins("[src] deadmined themself.")
			deadmin()
			verbs += /client/proc/readmin
			deadmins += ckey
			src << "<span class='interface'>You are now a normal player.</span>"
			if(!config.allow_vote_restart)
				var/admins_number = 0
				for(var/client/admin in admins)
					if(check_rights_for(admin, R_ADMIN))
						admins_number++
				if(admins_number == 0)
					log_admin("No staff left with +ADMIN. Restart vote allowed.")
					message_admins("No staff left with +ADMIN. Restart vote allowed.")
					config.allow_vote_restart = 1
	feedback_add_details("admin_verb","DAS") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!

/client/proc/toggle_log_hrefs()
	set name = "Toggle href logging"
	set category = "Server"
	if(!holder)	return
	if(config)
		if(config.log_hrefs)
			config.log_hrefs = 0
			src << "<b>Stopped logging hrefs</b>"
		else
			config.log_hrefs = 1
			src << "<b>Started logging hrefs</b>"

/client/proc/check_ai_laws()
	set name = "Check AI Laws"
	set category = "Admin"
	if(holder)
		src.holder.output_ai_laws()

/client/proc/readmin()
	set name = "Re-admin self"
	set category = "Admin"
	set desc = "Regain your admin powers."
	var/list/rank_names = list()
	for(var/datum/admin_rank/R in admin_ranks)
		rank_names[R.name] = R
	var/datum/admins/D = admin_datums[ckey]
	var/rank = null
	if(config.admin_legacy_system)
		//load text from file
		var/list/Lines = file2list("config/admins.txt")
		for(var/line in Lines)
			var/list/splitline = text2list(line, " = ")
			if(lowertext(splitline[1]) == ckey)
				if(splitline.len >= 2)
					rank = ckeyEx(splitline[2])
				break
			continue
	else
		if(!dbcon.IsConnected())
			message_admins("Warning, mysql database is not connected.")
			src << "Warning, mysql database is not connected."
			return
		var/sql_ckey = sanitizeSQL(ckey)
		var/DBQuery/query = dbcon.NewQuery("SELECT rank FROM [format_table_name("admin")] WHERE ckey = '[sql_ckey]'")
		query.Execute()
		while(query.NextRow())
			rank = ckeyEx(query.item[1])
	if(!D)
		if(rank_names[rank] == null)
			var/error_extra = ""
			if(!config.admin_legacy_system)
				error_extra = " Check mysql DB connection."
			src << "Error while re-adminning, admin rank ([rank]) does not exist.[error_extra]"
			WARNING("Error while re-adminning [src], admin rank ([rank]) does not exist.[error_extra]")
			return
		D = new(rank_names[rank],ckey)
		var/client/C = directory[ckey]
		D.associate(C)
		message_admins("[src] re-adminned themselves.")
		log_admin("[src] re-adminned themselves.")
		deadmins -= ckey
		if(config.allow_vote_restart)
			var/admins_number = 0
			for(var/client/admin in admins)
				if(check_rights_for(admin, R_ADMIN))
					admins_number++
			if(admins_number > 0)
				log_admin("Staff joined with +ADMIN. Restart vote disallowed.")
				message_admins("Staff joined with +ADMIN. Restart vote disallowed.")
				config.allow_vote_restart = 0
		feedback_add_details("admin_verb","RAS")
		return
	else
		src << "You are already an admin."
		verbs -= /client/proc/readmin
		deadmins -= ckey
		return

/client/proc/populate_world(amount = 50 as num)
	set name = "Populate World"
	set category = "Debug"
	set desc = "(\"Amount of mobs to create\") Populate the world with test mobs."

	if (amount > 0)
		var/area/area
		var/list/candidates
		var/turf/simulated/floor/tile
		var/j,k
		var/mob/living/carbon/human/mob

		for (var/i = 1 to amount)
			j = 100

			do
				area = pick(the_station_areas)

				if (area)

					candidates = get_area_turfs(area)

					if (candidates.len)
						k = 100

						do
							tile = pick(candidates)
						while ((!tile || !istype(tile)) && --k > 0)

						if (tile)
							mob = new/mob/living/carbon/human/interactive(tile)

							testing("Spawned test mob with name \"[mob.name]\" at [tile.x],[tile.y],[tile.z]")
			while (!area && --j > 0)

/client/proc/toggle_restart_vote()
	set name = "Toggle Restart Vote"
	set category = "Server"
	set desc = "Toggle Restart Vote for Moderators"

	if(config.allow_vote_restart == 1)
		config.allow_vote_restart = 0
		message_admins("[src] toggled the restart vote off.")
		log_admin("[src] toggled the restart vote off.")
	else
		config.allow_vote_restart = 1
		message_admins("[src] toggled the restart vote on.")
		log_admin("[src] toggled the restart vote on.")


/client/proc/rejuv_all()
	set name = "Rejuvinate everyone"
	set category = "Fun"
	set desc = "Rejuvinate every mob/living."
	var/revive_count = 0

	var/fluff_adjective = pick("benevolent","sacred","holy","godly","magnificent","benign","generous","caring") //lol
	var/fluff_adverb = pick("tenderly","gently","elegantly","gracefully","mercifully","affectionately","sympathetically","politely") //am having a lot of fun here

	if(!check_rights(R_REJUVINATE))
		return

	for(var/mob/living/M in world)
		M.revive()
		revive_count++

	world << "<b>The [fluff_adjective] admins have decided to [fluff_adverb] revive everyone. :)</b>"
	message_admins("[src] revived [revive_count] mobs.")
	log_admin("[src] revived [revive_count] mobs.")
