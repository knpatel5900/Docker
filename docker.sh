#!/bin/bash
bold=`tput smso`
unbold=`tput rmso`
under=`tput smul`
nounder=`tput rmul`
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) #  red
bldblu=${txtbld}$(tput setaf 4) #  blue
bldwht=${txtbld}$(tput setaf 7) #  white
txtrst=$(tput sgr0)
tme=` date | awk '{print $4}' `
dte=` date | awk '{print $1 , $2 , $3 , $6}' `
hst=`hostname`
who=`whoami`
clear;
headtop()
{
tput cup  4 20 ; echo "${bold} # # # # # # D O C K E R  O P E R A T I O N   M E N U # # # # # # ${unbold}"
tput cup  5 20 ; echo "User ==> $who                   Hostname ==> $hst ";
tput cup  6 54 ; echo "Date ==> $dte ";
tput cup  7 54 ; echo "Time ==> $tme";
}
menu()
{
tput cup  8 29 ; echo "+==============${txtbld}${bldred}${under}Dockers${nounder}${txtrst}==============+";
tput cup  9 29 ; echo "| --------------------------------- |";
tput cup 10 29 ; echo "| |1. Docker Image-Operations     | |";
tput cup 11 29 ; echo "| |2. Docker Container-Operations | |";
tput cup 12 29 ; echo "| |3. Docker Process-Operations   | |";
tput cup 13 29 ; echo "| |4. Docker Backup-Operations    | |";
tput cup 14 29 ; echo "| |5. Docker Volume-Operations    | |";
tput cup 15 29 ; echo "| |6. Docker Network-Operations   | |";
tput cup 16 29 ; echo "| |7. Docker Version Info         | |";
tput cup 17 29 ; echo "| --------------------------------- |";
tput cup 18 29 ; echo "+===================================+";
}
inpu()
{
tput cup 20 42 ; echo "<== ${bold}E/e for Exit${unbold}";
tput cup 20 31 ; echo -n "CHOICE::-"; read choice;
}

input1()
{
menu
tput cup 20 30 ; echo "You Have Entered the Incorrect Input";
}
headtop
menu
inpu

case $choice in

1|2|3|4|5|6|7)

        if [ "$choice" -eq 1 ]
        then

        function di()
        {


        clear;
        tput cup  5 20 ; echo "${bold} # # # # # # D O C K E R  O P E R A T I O N   I M A G E-O P E R A T I O N   M E N U # # # # # # ${unbold}"
        menu
        tput cup 10 29 ; echo "| |1.${bold} Docker Image-Operations ${unbold}";
        tput cup 10 63 ; echo "| ${bold}==>${unbold}";
        tput cup 10 69 ; echo "+=======${under}Image-Operations${nounder}========+";
        tput cup 11 69 ; echo "|  ---------------------------  |";
        tput cup 12 69 ; echo "| |1. List Docker Images      | |";
        tput cup 13 69 ; echo "| |2. Pull Image              | |";
        tput cup 14 69 ; echo "| |3. Remove Image            | |";
        tput cup 15 69 ; echo "| |4. Inspect Image           | |";
        tput cup 16 69 ; echo "| |5. Prune Images            | |";
        tput cup 17 69 ; echo "|  ---------------------------  |";
        tput cup 18 69 ; echo "+===============================+";
        tput cup 20 80 ; echo "<== ${bold}E/e for Main Menu${unbold}";
        tput cup 20 69 ; echo -n "CHOICE::-"; read kp;

               case $kp in

                1)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  D O C K E R  I M A G E S  L I S T S # # # # # # ${unbold}"
				echo "";
				docker images
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                clear;
                di
                ;;

                2)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  P U L L  I M A G E  # # # # # # ${unbold}"
				echo "";
				echo -n "Enter the name of the Image to Pull::-"; read dp;
				docker pull $dp ;
				#Write Your Code#
				echo "";
				echo " Image Pulled";
				echo -n "Press Any key for Main Menu....."; read r;
                di
                ;;
                3)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  R E M O V E  I M A G E  # # # # # # ${unbold}"
				echo "";
				docker images
				echo "";
				echo -n "Enter the Docker Image Name From above list to Remove::-"; read i; 
				docker rmi $i
				echo "";
				docker images
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                di
                ;;
                4)
				clear;
                 tput cup  5 0 ; echo "${bold} # # # # # #  I N S P E C T  I M A G E  # # # # # # ${unbold}"
				echo "";
				docker images | awk '{print $1 }'
				echo "";
				echo -n "Enter the Image Name::-"; read im;
				docker inspect $im | more ;
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                di
                ;;
				

                5)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  P R U N E  I M A G E  # # # # # # ${unbold}"
				echo "";
				echo " This Option will Remove all The Images from the List::-";  
				#Write Your Code#
				echo"";
				echo -n "${bold} Press Any key for Main Menu....." ${unbold}; read r;
                di
                ;;


                E|e)
                clear
                sh /root/docker.sh
                clear;
                ;;
                *)
                tput cup 21 69; echo "You Have Entered the Incorrect Input";
                tput cup 22 69 ; echo "Your input is ==> ${bold} $kp ${unbold} <== Which is Incorrect";
                tput cup 23 69 ; echo -n "Press Enter the to Continue... "; read cont;
                di
                ;;
                esac
                }
                di

#######################################################################################################################################
#START of D
        elif [ "$choice" -eq 2 ]
        then
        dc()
        {
        clear;
        tput cup  5 20 ; echo "${bold} # # #  D O C K E R  C O N T A I N E R - O P E R A T I O N    M E N U  # # # ${unbold}"
        menu
        tput cup 11 29 ; echo "| |2.${bold} Docker Container-Operation ${unbold}";
        tput cup 11 63 ; echo "| ${bold}==>${unbold}";
        tput cup 11 69 ; echo "+============${under}Container-Operations${nounder}===========+";
        tput cup 12 69 ; echo "|  ---------------------------------------  |";
        tput cup 13 69 ; echo "| |1. List  Containers                    | |";
        tput cup 14 69 ; echo "| |2. Start Container                     | |";
        tput cup 15 69 ; echo "| |3. Stop Container                      | |";
        tput cup 16 69 ; echo "| |4. Remove Specific Container           | |";
        tput cup 17 69 ; echo "| |5. Remove all Containers               | |";
        tput cup 18 69 ; echo "|  ---------------------------------------  |";
        tput cup 19 69 ; echo "+===========================================+";
        tput cup 21 80 ; echo "<== ${bold}E/e for Main Menu${unbold}";
        tput cup 21 69 ; echo -n "CHOICE::-"; read db;

                case $db in
                1)
                clear
                tput cup  5 0 ; echo "${bold} # # # # # #  C O N T A I N E R  L I S T  # # # # # # ${unbold}"
				echo "";
				docker container ls
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                clear;
                dc
                ;;
                2)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  S T A R T  C O N T A I N E R  # # # # # # ${unbold}"
				echo "";
				docker ps -a
				echo "";
				echo -n "Enter the Name of Container to Start from above List::-"; read d;
				docker start $d
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dc
                ;;
                3)
                clear
                tput cup  5 0 ; echo "${bold} # # # # # #  S T O P  C O N T A I N E R  # # # # # # ${unbold}"
				echo "";
				echo "";
				docker ps -a
				echo "";
				echo -n "Enter the Name of Container to Stop from above List::-"; read d;
				docker stop $d
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dc
                ;;
                4)
                clear
                tput cup  5 0 ; echo "${bold} # # # # # # R E M O V E  C O N T A I N E R  # # # # # # ${unbold}"
				echo "";
				docker ps -a
				echo"";
				echo "${bold}Stop Container Before Removing it...${unbold}"
				echo "";
				echo -n "Enter the Name of Container to Remove from above List::-"; read d;
				docker rm $d
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
				  dc
                ;;
                5)
                clear
				tput cup  5 0 ; echo "${bold} # # # # # #  R E M O V E  A L L  C O N T A I N E R  # # # # # # ${unbold}"
				echo "";
				docker ps -a
				echo "${bold}It will Remove all Container from Above List...${unbold}"
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dc
                ;;
                E|e)
                clear;
                exec /root/docker.sh
                ;;
                *)
                tput cup 22 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 23 69 ; echo "Your input is ==> ${bold} $db ${unbold} <== Which is Incorrect";
                tput cup 24 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear;
                dc
                ;;
                esac
                }
                dc



#END of DC



#######################################################################################################################################

#START OF DOcker Proecss
        elif [ "$choice" -eq 3 ]
        then
        dp()
        {
        clear;
        tput cup  5 20 ; echo "${bold} # # #  D O C K E R  P R O C E S S - O P E R S T I O N - M E N U  # # # ${unbold}"
        menu
        tput cup 12 29 ; echo "| |3.${bold} Docker Process-Operation ${unbold}";
        tput cup 12 63 ; echo "| ${bold}==>${unbold}";
        tput cup 12 69 ; echo "+=====${under} Process Operations${nounder}=====+";
        tput cup 13 69 ; echo "|  -------------------------- |";
        tput cup 14 69 ; echo "| |1. List Docker Process   | |";
        tput cup 15 69 ; echo "| |2. Kill Docker Process   | |";
        tput cup 16 69 ; echo "|  -------------------------- |";
        tput cup 17 69 ; echo "+=============================+";
        tput cup 19 80 ; echo "<== ${bold}E/e for Main Menu${unbold}";
        tput cup 19 69 ; echo -n "CHOICE::-"; read kaf;

                case $kaf in
                1)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  D O C K E R  P R O C E S S   # # # # # # ${unbold}"
				echo "";
				docker ps -a
				echo "";
				echo -n "Press Any key for Main Menu....."; read r;
                clear;
                dp
                ;;
                2)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  K I L L  P R O C E S S  # # # # # # ${unbold}"
				echo "";
				echo -n "Enter the name of Container to kill Process::-"; read din;
				docker kill $din ;
				#Write Your Code#
				echo "";
				echo -n "Press Any key for Main Menu....."; read r;
                dp
                ;;

                E|e)
                clear;
                exec /root/docker.sh
                ;;

                *)
                tput cup 20 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 21 69 ; echo "Your input is ==> ${bold} $kaf ${unbold} <== Which is Incorrect";
                tput cup 22 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear;
                dp
                ;;
                esac
                }
                dp




#END OF KILL Docker PROCESS

#################################################################################################################################

#END of DI MENU

        elif [ "$choice" -eq 4 ]
        then
        db()
        {
        clear;
        tput cup  5 20 ; echo "${bold} # # #  D O C K R  B A C K U P - O P E R A T I O N S  M E N U  # # # ${unbold}"
        menu
        tput cup 13 29 ; echo "| |4.${bold} Docker Backup-Operations ${unbold}";
        tput cup 13 63 ; echo "| ${bold}==>${unbold}";
        tput cup 13 69 ; echo "+=======${under}Backup Operations${nounder}=======+";
        tput cup 14 69 ; echo "|  ---------------------------  |";
        tput cup 15 69 ; echo "| |1. Docker Image Backup     | |";
        tput cup 16 69 ; echo "| |2. Docker Container Backup | |";
        tput cup 17 69 ; echo "| |3. Docker Network Backup   | |";
        tput cup 18 69 ; echo "| |4. Docker Volume Backup    | |";
        tput cup 19 69 ; echo "| |5. Extra                   | |";
        tput cup 20 69 ; echo "|  ---------------------------  |";
        tput cup 21 69 ; echo "+===============================+";
        tput cup 23 80 ; echo "<== ${bold}E/e for Main Menu${unbold}";
        tput cup 23 69 ; echo -n "CHOICE::-"; read rarr;

                case $rarr in
                1)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  D O C K E R  I M A G E  B A C K U P  # # # # # # ${unbold}"
				echo "";
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                clear;
                db
                ;;
                2)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  C O N T A I N E R  B A C K U P  # # # # # # ${unbold}"
				echo "";
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                db
                ;;
                3)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  N E T W O R K  B A C K U P  # # # # # # ${unbold}"
				echo "";
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                db
                ;;
                4)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  V O L U M E  B A C K U P  # # # # # # ${unbold}"
				echo "";
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                db
                ;;
                5)
                clear
                tput cup  5 0 ; echo "${bold} # # # # # #  E X T R A  # # # # # # ${unbold}"
				echo "";
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                db
                ;;

                E|e)
                clear;
                exec /root/docker.sh
                ;;
                *)
                tput cup 24 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 25 69 ; echo "Your input is ==> ${bold} $rarr ${unbold} <== Which is Incorrect";
                tput cup 26 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear;
                db
                ;;
                esac
                }
                db


#END of DB

#####################################################################################################################################

#START OF DOCKER VOLUME OPERATION
        elif [ "$choice" -eq 5 ]
        then
        dv()
        {
        clear;
        tput cup  5 20 ; echo "${bold} # # # # # # D O C K E R  V O L U M E  O P E R A T I O N   M E N U # # # # # # ${unbold}"
        menu
        tput cup 14 29 ; echo "| |5.${bold} Docker Volume-Operation ${unbold}";
        tput cup 14 63 ; echo "| ${bold}==>${unbold}";
        tput cup 14 69 ; echo "+======${under}Volume-Operation${nounder}======+";
        tput cup 15 69 ; echo "|  ------------------------  |";
        tput cup 16 69 ; echo "| |1. List Volume          | |";
        tput cup 17 69 ; echo "| |2. Create Volume        | |";
        tput cup 18 69 ; echo "| |3. Remove Volume        | |";
        tput cup 19 69 ; echo "| |4. Inspect Volume       | |";
        tput cup 20 69 ; echo "| |5. Prune Volume         | |";
        tput cup 21 69 ; echo "|  ------------------------  |";
        tput cup 22 69 ; echo "+============================+";
        tput cup 24 80 ; echo "<==${bold}E/e for Main Menu${unbold}";
        tput cup 24 69 ; echo -n "CHOICE::-"; read dop;
                case $dop in
                1)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  V O L U M E  L I S T S  # # # # # # ${unbold}"
				echo "";
				docker volume ls ;
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dv
                ;;
              
                2)
				clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  C R E A T E  V O L U M E  # # # # # # ${unbold}"
				echo "";
				echo -n "Enter name of the Volume to Create Volume::-" ; read dv;
				docker volume create $dv ;
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                clear;
                dv
                ;;
			
                3)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # #  R E M O V E  V O L U M E  # # # # # # ${unbold}"
				echo "";
				docker volume ls | awk '{print $2}';
				echo "";
				echo -n "Enter the name of Volume to Remove::-"; read dr;
				docker volume rm $dr ;
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dv
                ;;

               4)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # # I N S P E C T  V O L U M E  # # # # # # ${unbold}"
				echo "";
				docker volume ls | awk '{print $2 }'
				echo "";
				echo -n "Enter the Volume Name From Above List::-"; read im;
				docker volume inspect $im | more ;
				#Write Your Code#
				echo"";
				echo -n "Press Any key for Main Menu....."; read r;
                dv
                ;;

                5)
                clear;
                tput cup  5 0 ; echo "${bold} # # # # # # P R U N E  V O L U M E  # # # # # # ${unbold}"
				echo "";
				echo "${bold} This option is Disabled You can Perform it Manually ${unbold}";
				#Write Your Code#
				echo"";

				echo -n "Press Any key for Main Menu....."; read r;
                dv
                ;;
                E|e)
                sh /root/docker.sh
                clear;
                ;;
                *)
                tput cup 25 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 26 69 ; echo "Your input is ==> ${bold} $dop ${unbold} <== Which is Incorrect";
                tput cup 27 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear;
                dv
                esac
                }
                dv
#END OF DV
##########################################################################################################################################
#START OF DN

        elif [ "$choice" -eq 6 ]
        then
        dn()
        {
        clear;
        tput cup  5 20 ; echo "${bold} # # # # # # D O C K E R  N E T W O R K  O P E R A T I O N   M E N U # # # # # # ${unbold}"
        menu
        tput cup 15 29 ; echo "| |6.${bold} Docker Network-Operations ${unbold}";
        tput cup 15 63 ; echo "| ${bold}==>${unbold}";
        tput cup 15 69 ; echo "+====${under}Network-Operations${nounder}====+";
        tput cup 16 69 ; echo "|  ------------------------|";
        tput cup 17 69 ; echo "| |1. List Network       | |";
        tput cup 18 69 ; echo "| |2. Create Network     | |";
        tput cup 19 69 ; echo "| |3. Remove Network     | |";
		tput cup 20 69 ; echo "| |4. Inspect Network    | |";
		tput cup 21 69 ; echo "| |5. Prune Network      | |";
		tput cup 22 69 ; echo "|  ------------------------|";
        tput cup 23 69 ; echo "+==========================+";
        tput cup 25 80 ; echo "<==${bold}E/e for Main Menu${unbold}";
        tput cup 25 69 ; echo -n "CHOICE::-"; read fg;
        case $fg in
        1)
		clear;
        tput cup  5 0 ; echo "${bold} # # # # # # L I S T  N E T W O R K S # # # # # # ${unbold}"
		echo "";
		docker network ls;
		echo "";
		echo -n "Press Any key for Main Menu....."; read r;
        dn
        clear;
        ;;

        2)
		clear
        tput cup  5 0 ; echo "${bold} # # # # # # C R E A T E  N E T W O R K # # # # # # ${unbold}"
		echo "";
		echo -n "Enter the Network Name::-"; read dnn;
		docker network create $dnn ;
		echo "";
		docker network ls;
		#Write Your Code#
		echo "";
		echo -n "Press Any key for Main Menu....."; read r;
        dn
        clear;
        ;;
		
		3)
        clear
        tput cup  5 0 ; echo "${bold} # # # # # # R E M O V E  N E T W O R K # # # # # # ${unbold}"
		echo "";
		docker network ls | awk '{print $2}' ;
		echo "";
		echo -n "Enter the name of Network to Remove::-"; read drn;
		docker network rm $drn ;
		#Write Your Code#
		echo "";
		echo -n "Press Any key for Main Menu....."; read r;
        dn
        clear;
        ;;

		4)
        clear;
        tput cup  5 0 ; echo "${bold} # # # # # # I N S P E C T  N E T W O R K  # # # # # # ${unbold}"
		echo "";
		echo "";
		docker network ls | awk '{print $2}';
		echo "";
		echo -n "Enter the Network Name From Above List::-"; read im;
		docker network inspect $im | more;
		#Write Your Code#
		echo "";
		echo -n "Press Any key for Main Menu....."; read r;
        dn
        clear;
        ;;
		
		 5)
        clear;
		tput cup  5 0 ; echo "${bold} # # # # # # P R U N E  N E T W O R K # # # # # # ${unbold}"
		echo "";
		echo "This Option is Disabled from Script You can Run in Normally" ; 
		#Write Your Code#
		echo "";
		echo -n "Press Any key for Main Menu....."; read r;
        echo "done"
        dn
        ;;
		
        E|e)
        sh /root/docker.sh
        ;;

                *)
                tput cup 26 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 27 69 ; echo "Your input is ==> ${bold} $fg ${unbold} <== Which is Incorrect";
                tput cup 28 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear;
                dn
                esac
                }
                dn
				
#END Docker Network
#Docker Volume
 elif [ "$choice" -eq 7 ]
        then
        dve()
        {
        clear
        tput cup  5 20 ; echo "${bold} # # # # # # D O C K E R  V E R S I O N  M E N U # # # # # # ${unbold}"
        menu
        tput cup 16 29 ; echo "| |7.${bold} Docker Version-Info ${unbold}";
        tput cup 16 63 ; echo "| ${bold}==>${unbold}";
        tput cup 16 69 ; echo "+=========${under}Version-Info${nounder}=========+";
        tput cup 17 69 ; echo "|  ---------------------------- |";
        tput cup 18 69 ; echo "| |1. Docker Version Info     | |";
        tput cup 19 69 ; echo "| |2. OS Version Info         | |";
        tput cup 20 69 ; echo "|  ---------------------------  |";
        tput cup 21 69 ; echo "+===============================+";
        tput cup 23 80 ; echo "<==${bold}E/e for Main Menu${unbold}";
        tput cup 23 69 ; echo -n "CHOICE::-"; read rop;

                case $rop in
                1)
                clear
				tput cup  5 0 ; echo "${bold} # # # # # # D O C K E R  V E R S I O N  I N F O # # # # # # ${unbold}"
				echo "";
  				dv=`docker version`;
				echo  "$dv" ;
				echo "";
                echo -n "Press Any key for Main Menu....."; read r;
                clear;
                dve
                ;;
                2)
                clear
                tput cup  5 0 ; echo "${bold} # # # # # # O S  V E R S I O N  I N F O # # # # # # ${unbold}"
                a=`uname -ar`;
				echo "";
			    echo "$a";
				echo "";
				echo -n "Press Any key for Main Menu....."; read r;
				dve
                ;;
                


                E|e)
                clear;
                exec /root/docker.sh
                ;;

                *)
                tput cup 24 69 ; echo "You Have Entered the Incorrect Input";
                tput cup 25 69 ; echo "Your input is ==> ${bold} $rop ${unbold} <== Which is Incorrect";
                tput cup 26 69 ; echo -n "Press Enter the to Continue... "; read cont;
                clear
                dve
                ;;
                esac
                }
                dve

#END OF dve 

fi
;;


E|e)
clear;
exit
;;

*)
tput cup 21 31 ; echo "You Have Entered the Incorrect Input";
tput cup 22 31 ; echo "Your input is ==> ${bold} $choice ${unbold} <== Which is Incorrect";
tput cup 23 31 ; echo -n "Press Enter the to Continue... "; read cont;
clear;
exec /root/docker.sh
;;

esac
