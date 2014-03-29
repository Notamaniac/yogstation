//wip wip wup
/obj/structure/mirror
	name = "mirror"
	desc = "Mirror mirror on the wall, who's the most robust of them all?"
	icon = 'icons/obj/watercloset.dmi'
	icon_state = "mirror"
	density = 0
	anchored = 1
	var/shattered = 0

/obj/structure/mirror/magic
	name = "magic mirror"
	icon_state = "magicmirror"
	desc = "The Polyjuice 3000 Magic Mirror is the best choice for any wizard who wants a long, white beard."

/obj/structure/mirror/attack_hand(mob/user as mob)
	if(shattered)	return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		var/userloc = H.loc

		//see code/modules/mob/new_player/preferences.dm at approx line 545 for comments!
		//this is largely copypasted from there.

		//handle facial hair (if necessary)
		if(H.gender == MALE)
			var/new_style = input(user, "Select a facial hair style", "Grooming")  as null|anything in facial_hair_styles_list
			if(userloc != H.loc) return	//no tele-grooming
			if(new_style)
				H.facial_hair_style = new_style
		else
			H.facial_hair_style = "Shaved"

		//handle normal hair
		var/new_style = input(user, "Select a hair style", "Grooming")  as null|anything in hair_styles_list
		if(userloc != H.loc) return	//no tele-grooming
		if(new_style)
			H.hair_style = new_style

		H.update_hair()

/obj/structure/mirror/magic/attack_hand(mob/user as mob)
	if(shattered)	return

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/userloc = H.loc
		var/new_hair = input(user, "Select a hair color", "Polyjuice 3000 Magic Mirror") as null|color
		if(userloc != H.loc) return
		if(new_hair)
			H.hair_color = sanitize_hexcolor(new_hair)

		var/new_facial = input(user, "Select a facial hair color", "Polyjuice 3000 Magic Mirror") as null|color
		if(userloc != H.loc) return
		if(new_facial)
			H.facial_hair_color = sanitize_hexcolor(new_facial)

		var/new_eyes = input(user, "Select an eye color", "Polyjuice 3000 Magic Mirror") as color|null
		if(userloc != H.loc) return
		if(new_eyes)
			H.eye_color = sanitize_hexcolor(new_eyes)

		var/new_s_tone = input(user, "Select a skin tone", "Polyjuice 3000 Magic Mirror")  as null|anything in skin_tones
		if(userloc != H.loc) return
		if(new_s_tone)
			H.skin_tone = new_s_tone

		..()
		H.update_body()


/obj/structure/mirror/proc/shatter()
	if(shattered)	return
	shattered = 1
	icon_state = "mirror_broke"
	playsound(src, "shatter", 70, 1)
	desc = "Oh no, seven years of bad luck!"


/obj/structure/mirror/bullet_act(var/obj/item/projectile/Proj)
	if(prob(Proj.damage * 2))
		if((Proj.damage_type == BRUTE || Proj.damage_type == BURN))
			if(!shattered)
				shatter()
			else
				playsound(src, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
	..()


/obj/structure/mirror/attackby(obj/item/I as obj, mob/user as mob)
	if(shattered)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
		return

	if(prob(I.force * 2))
		visible_message("<span class='warning'>[user] smashes [src] with [I]!</span>")
		shatter()
	else
		visible_message("<span class='warning'>[user] hits [src] with [I]!</span>")
		playsound(src.loc, 'sound/effects/Glasshit.ogg', 70, 1)


/obj/structure/mirror/attack_alien(mob/user as mob)
	if(islarva(user)) return
	if(shattered)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
		return
	user.visible_message("<span class='danger'>[user] smashes [src]!</span>")
	shatter()


/obj/structure/mirror/attack_animal(mob/user as mob)
	if(!isanimal(user)) return
	var/mob/living/simple_animal/M = user
	if(M.melee_damage_upper <= 0) return
	if(shattered)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
		return
	user.visible_message("<span class='danger'>[user] smashes [src]!</span>")
	shatter()


/obj/structure/mirror/attack_slime(mob/user as mob)
	if(shattered)
		playsound(src.loc, 'sound/effects/hit_on_shattered_glass.ogg', 70, 1)
		return
	user.visible_message("<span class='danger'>[user] smashes [src]!</span>")
	shatter()