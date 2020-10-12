# Razorfy
Alpine Linux based image for razorfy rspamd helper, taken from a16bitsysop/razorfy

RAZORFY_BINDADDRESS is already set to 0.0.0.0 to listen to all interfaces, this is done in the razor .profile file.

## Environment Variables
| Name                | Desription                                             | Default   |
| ------------------- | ------------------------------------------------------ | --------- |
| RAZORFY_BINDPORT    | Port that razorfy listens on                           | 11342     |
| RAZORFY_MAXTHREADS  | Maximum numbers of threads to use                      | 2000      |
| RAZORFY_DEBUG       | Set to 1 to enable debug logging                       | 0         |

## Examples
**To run a container exposing razorfy port with verbose logging**
```bash
root@me:~# COMMON_MOUNTS="-v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro -v /etc/locale.gen:/etc/locale.gen:ro"
root@me:~# docker run -p 11342:11342 -d --name razorfy -e RAZORFY_DEBUG=1 $COMMON_MOUNTS neomediatech/razorfy
```
