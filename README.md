# Planet

# Environment 
* Phoenix v1.7.12
* Elixir v1.14.5 (compiled with Erlang/OTP 26)
* Erlang/OTP 26 [erts-14.2.5] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]
* PostgreSQL 14.12



## Step to Build the Environment

1. Start up a Docker container
```bash
make up
```
if returned below, give a permission 
```bash
export DOCKER_BUILDKIT=0
```

2. Set up Phoenix
Enter an elixir comtainer "web"
```bash
make web
```
After entered the container
```
mix setup
```
