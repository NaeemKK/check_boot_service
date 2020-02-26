systemctl is-active docker
stat=$(echo $?)
if [ $stat -ne 0 ]
then 
	sleep 5
	echo "docker service could not be found. Reboot!"
	/sbin/reboot
else 
	# ToDO: check if upgrade_available is one,make it
        # zero
	

	# Make current deployed image the default one
	# If new deployent has no issue and it needs to
	# be the default one, folowing comand will result
	# in failure. If we have rollbacked after number 
	# of retries equal to bootlimit env variable of
	# uboot, following command will delete the latest
	# unusable deployment
        ostree admin undeploy 0
fi
