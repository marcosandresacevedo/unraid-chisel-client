FROM jpillora/chisel

#Override base image behavior.
ENTRYPOINT []

#Specify client or server mode. Possible values are client | server.
#For the purposes of this Unraid container, we'll be forcing client mode
ENV mode='client'

#Whether chisel should function as a reverse tunnel.
#For the purposes of this Unraid container, it will be forced.
ENV reverse_flag = 'R'

#Only for server mode. Set the port through which a chisel client will connect to. Defaults to 8080.
#Since client mode is forced, this will have no effect.
#ENV default_listen_port = '8080'

#IP address or URL of the public cloud or virtual machine that contains an instance of chisel server running.
#For use in client mode.
ENV chisel_server = ''

#Port of the chisel server that will receive the connection from the client to establish a tunnel.
#Defined when executing chisel server on the cloud instance or VM. Defaults to 8080 on the server if not specified. 
#You must configure the proper firewall rules in your cloud provider.
ENV chisel_server_port = '8080'

#Host or IP address of the webapp/container that you want to expose to the public internet through the proxy'd tunnel.
#This could be an Nginx reverse proxy with ssl termination or some other container or webapp in unraid.
ENV unraid_resource = ''

#Port on the unraid_resource that is receiving the requests.
ENV unraid_resource_port = '' 

#Enable verbose output
ENV verbose='-v'

#Port on the server that will accept incomming requests.
#This will tipically be 80 or 443 but will ultimately depend on what type of resource you're exposing
#to the internet from your Unraid NAS. You must configure the proper firewall rules in your cloud provider.
ENV public_connection_port='80'

#Run the chisel client in reverse proxy mode when conecting to the server.
CMD ["sh", "-c", "/app/chisel ${mode} ${verbose} ${chisel_server}:${chisel_server_port} R:${public_connection_port}:${unraid_resource}:${unraid_resource_port}"]