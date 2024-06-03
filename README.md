# Planet

# Environment 
* Phoenix v1.7.12
* Elixir v1.14.5 (compiled with Erlang/OTP 26)
* Erlang/OTP 26 [erts-14.2.5] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit]
* PostgreSQL 14.12

Environment Observed in 
* macOS: Sonoma 14.4.1
  * Apple M3
  * Docker Desktop for Mac v25.0.3
* WindowsOS: Windows 11 Home
  * 11th Gen Intel(R) Core(TM) i5-11400H
  * Docker Desktop for Windows v23.0.5


## Step to Build the Environment

1. Copy .env.exaple and make .env
```bash
cp .env.example .env
```

2. Start up a Docker container
```bash
make up
```
if returned below, give a permission 
```bash
export DOCKER_BUILDKIT=0
```

3. Set up Phoenix
Enter an elixir comtainer "web"
```bash
make web
```
After entered the container
```
mix setup
```
