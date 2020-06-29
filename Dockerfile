FROM jpillora/chisel

#Specify client or server mode. Possible values are client | server.
#For the purposes of this fork for unraid, we'll be forcing client mode
ENV mode='client'

#Whether chisel should function as a reverse tunnel.
#For the purposes of this specific unraid fork, it will be forced.
ENV reverse_flag = 'R'

#Only for server mode. Set the port through which a chisel client will connect to. Defaults to 8080.
#Since client mode is forced, this will have no effect.
#ENV default_listen_port = '8080'

#IP address or URL of the public cloud or virtual machine that contains an instance of chisel server running.
#For use in client mode.
ENV chiselserver = ''

#Host or IP address of the webapp/container that you want to expose to the public internet through the proxy'd tunnel.
#This could be an Nginx reverse proxy with ssl termination or some other container or webapp in unraid.
ENV unraid_resource = ''

#Port on the unraid_resource that is recieving the requests.
ENV unraid_resource_port = '' 

#Enable verbose output
ENV verbose='-v'

#Local port on the container that chisel will recieve traffic from the chisel server. Default to 3000.
ENV local_container_port='3000'

#Run the chisel client in reverse proxy mode when conecting to the server.
CMD [ "chisel", ${mode}, $(verbose), ${chiselserver}, ${reverse_flag}":"${local_container_port}":"${unraid_resource}":"${unraid_resource_port}]