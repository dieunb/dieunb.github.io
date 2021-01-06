# Networking

Create a new bridge network

```
docker network create your_network_name #
```

Start container from image any join them to network created

```
docker run -d -p 3000:3000 --network mvc_network --name web dieunb/ruby_mvc:0.0.3
docker run -d --network mvc_network --name northwind_db dieunb/northwind_db:0.0.1
```

Access your service by [http://localhost:3000](http://localhost:3000)
