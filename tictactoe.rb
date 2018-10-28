# Voici les règles du programme :

#     le programme est à deux joueurs.
# #maka 2 players: manontan anaran de mienregistre anarana [ atao naty array]
# rah mbola tsisy de mangatak de ramis de mitoy hoaz

#     le programme doit afficher le plateau chaque tour (dans le terminal), puis demander au joueur auquel c'est le tour où ce dernier compte jouer
# #miafficher anle board, mantan we tourniza de aveo aiz no mametrak
#     si un joueur gagne, le programme doit annoncer qui a gagné
# #mverifier we mis telo mifanits de rah mfanits de milaza n pro we maresy le nametraka farany
#     s'il y a match nul, le programme doit annoncer qu'il y a match nul
# #feno ny case 9 nefa tsis mares de milaz n pro we match nul de mamerina jeu
#     (À la fin d'une partie, le programme doit proposer une autre partie
#     Un effort sera à faire sur la présentation (par ex: board affiché de façon stylé, compteur des parties, couleurs, etc...)

# Organisation

# Le programme doit avoir 4 classes :

#     Game : c'est la partie. Elle initialise tout et lance le jeu
class Game
    #Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
     $soustitre = "=jeu=====cases"
        $ttab1 = " | |     1|2|3"
        $ttab2 = "=*=*=    =*=*="
        $ttab3 = " | |     4|5|6"
        $ttab4 = "=*=*=    =*=*="
        $ttab5 = " | |     7|8|9"

    def board
        puts $soustitre
        puts $ttab1
        puts $ttab2
        puts $ttab3
        puts $ttab4
        puts $ttab5

    end
    #     BoardCase : c'est une case. Il devrait y avoir 9 instances de cette classe dans ta partie
    def selectcase(casecase, pion)
         case casecase
             when "1" 
             $ttab1[0] = pion if $ttab1[0] == " "
             when "2"
             $ttab1[2] = pion if $ttab1[2] == " "
             when "3"
             $ttab1[4] = pion if $ttab1[4] == " "
             when "4"
             $ttab3[0] = pion if $ttab3[0] == " "
             when "5"
             $ttab3[2] = pion if $ttab3[2] == " "
             when "6"
             $ttab3[4] = pion if $ttab3[4] == " "
             when "7"
             $ttab5[0] = pion if $ttab5[0] == " "
             when "8"
             $ttab5[2] = pion if $ttab5[2] == " "
             when "9"
             $ttab5[4] = pion if $ttab5[4] == " "
           else
             puts "Choisir entre 1 à 9 selon le dessin à coté"
             chgtjoueur
         end
    end
    #     Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie
    def selectplayer
    $vato1 = "X"
    $vato2 = "O"

    puts "Joueur 1, entrer votre nom"
    $joueur1 = gets.chomp.to_s
    puts "#{$joueur1} votre pion est #{$vato1}"
    puts "Joueur 2, entrer votre nom"
    $joueur2 = gets.chomp.to_s
    puts "#{$joueur2} votre pion est #{$vato2}"
        #inon ny vato apesainle joueur O et X

    end
    $save_jr = ""
    def chgtjoueur
        if $save_jr == ""
                puts "qui va commencer le jeu ?"
                premjoueur = gets.chomp.to_s

                if premjoueur == $joueur1
                    puts "#{$joueur1} Choisir entre 1 à 9"
                    c = gets.chomp
                    selectcase(c, $vato1)
                    board
                    gameover
                    $save_jr = $joueur1
                    chgtjoueur

                elsif premjoueur == $joueur2
                    puts "#{$joueur2} Choisir entre 1 à 9"
                    c = gets.chomp
                    selectcase(c, $vato2)
                    board
                    gameover
                    $save_jr = $joueur2
                    chgtjoueur
                  else
                    chgtjoueur
                end
        else
            if $save_jr == $joueur1
                    puts "#{$joueur2} Choisir entre 1 à 9"
                    c = gets.chomp
                    selectcase(c, $vato2)
                    board
                    gameover
                    $save_jr = $joueur2
                    chgtjoueur

                elsif $save_jr == $joueur2
                    puts "#{$joueur1} Choisir entre 1 à 9"
                    c = gets.chomp
                    selectcase(c, $vato1)
                    board
                    gameover
                    $save_jr = $joueur1
                    chgtjoueur
                  else
                    chgtjoueur
                end
        end
    end
    def iza
        selectplayer
        puts "La partie commence :"
        board
        chgtjoueur
    end
    def verif_case(vvr)
      if vvr == "X"
          puts "vous etes le champion #{$joueur1}"
          rejouer
        elsif vvr == "O"
          puts "vous etes le champion #{$joueur2}"
          rejouer
      end
    end
    def gameover
      # fin si match nul ou un gagnant
      # tav est l'equivalent des 9 cases du table de jeu
     tav = [$ttab1[0], $ttab1[2], $ttab1[4], $ttab3[0], $ttab3[2],$ttab3[4], $ttab5[0], $ttab5[2], $ttab5[4]]
     long = tav.select { |x| x == "X" || x == "O"}
     # tous les variable 'var' sont les trois cases verticales, horizontales, ou diagonales ; unes d'elles sont remplient si un joueur gagne
       var1 = tav[0, 3]
       long1 = var1.select { |x| x == "X"} #si les trois cases long1 sont remplient de "X", length avec "X" = 3
       long11 = var1.select { |x| x == "O"} #si les trois cases long1 sont remplient de "O", length avec "0" = 3
       var2 = tav[3, 3]
       long2 = var2.select { |x| x == "X"}
       long22 = var2.select { |x| x == "O"}
       var3 = tav[6, 3]
       long3 = var3.select { |x| x == "X"}
       long33 = var3.select { |x| x == "O"}
       var4 = []
       var4[0] = tav[0]
       var4[1] = tav[3]
       var4[2] = tav[6]
       long4 = var4.select { |x| x == "X"}
       long44 = var4.select { |x| x == "O"}
       var5 = []
       var5[0] = tav[1]
       var5[1] = tav[4]
       var5[2] = tav[7]
       long5 = var5.select { |x| x == "X"}
       long55 = var5.select { |x| x == "O"}
       var6 = []
       var6[0] = tav[2]
       var6[1] = tav[5]
       var6[2] = tav[8]
       long6 = var6.select { |x| x == "X"}
       long66 = var6.select { |x| x == "O"}
       var7 = []
       var7[0] = tav[0]
       var7[1] = tav[4]
       var7[2] = tav[8]
       long7 = var7.select { |x| x == "X"}
       long77 = var7.select { |x| x == "O"}
       var8 = []
       var8[0] = tav[2]
       var8[1] = tav[4]
       var8[2] = tav[6]
       long8 = var8.select { |x| x == "X"}
       long88 = var8.select { |x| x == "O"}
       if long.length == 9
         puts "match nul, voulez vous rejouer"
         rejouer
       elsif long1.length == 3
         verif_case(var1[0])
       elsif long11.length == 3
         verif_case(var1[0])
       elsif long2.length == 3
         verif_case(var2[0])
       elsif long22.length == 3
         verif_case(var2[0])
       elsif long3.length == 3
         verif_case(var3[0])
       elsif long33.length == 3
         verif_case(var3[0])
       elsif long4.length == 3
         verif_case(var4[0])
       elsif long44.length == 3
         verif_case(var4[0])
       elsif long5.length == 3
         verif_case(var5[0])
       elsif long55.length == 3
         verif_case(var5[0])
       elsif long6.length == 3
         verif_case(var6[0])
       elsif long66.length == 3
         verif_case(var6[0])
       elsif long7.length == 3
         verif_case(var7[0])
       elsif long77.length == 3
         verif_case(var7[0])
       elsif long8.length == 3
         verif_case(var8[0])
       elsif long88.length == 3
         verif_case(var8[0])          
       end
     end
     def rejouer
       puts 'nouveau jeux ? entrer "y" ou "n"'
       nv = gets.chomp
       if nv == "y"
         $save_jr = ""
         $joueur1 = ""
         $joueur2 = ""
         $ttab1[0] = " "; $ttab1[2] = " "; $ttab1[4] = " "; $ttab3[0] = " "; $ttab3[2] = " "; $ttab3[4] = " "; $ttab5[0] = " "; $ttab5[2] = " "; $ttab5[4] = " ";
         iza
       elsif nv == "n"
         exit
       else
         rejouer
       end
     end
end
 t = Game.new
 t.iza

# Commence par définir tes classes. Chaque classe doit avoir des rôles bien précis :

#     Board : à l'initialisation, le plateau doit instancier 9 BoardCases. Le plateau doit s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de empty à X ou O), vérifie en fonction de la combinaison des BoardCases si un joueur enchaine trois symboles d'affichés.
#     BoardCase : un BoardCase renseigne de l'état d'une case : soit elle est vide (personne n'a joué dessus), soit elle a comme valeur X, soit elle a comme valeur O
#     Player : un joueur a un nom (habile), et un état (victoire s'il a gagné)
#     Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle créé 2 instance de Player, et 1 instance de Board (l'instance de Board, initialise 9 instances de BoardCases). Game s'occupe de finir la partie si un joueur a gagné, de demander aux utilisateurs où ils veulent jouer à chaque tour

# Comment afficher ? Pour afficher le plateau, c'est plus simple que cela en a l'air. Il faut afficher une méthode to_s (to_string, une méthode qui marche pour les classes array, integer, etc) qui renvoie le plateau (ou les cases) au format string.
