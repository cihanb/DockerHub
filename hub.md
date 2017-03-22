# What is Redis Enterprise Pack? #
[**Redis Enterprise Pack**](https://redislabs.com/products/redis-pack/) is enterprise grade, highly available, scalable, distributed, in-memory NoSQL database server, fully compatible with open source Redis by Redis Labs.

**Note: **_Open source Redis applications transparently work against Redis Pack; Simply change your connections to point at Redis Pack._

Redis Pack extends open source Redis and delivers tangible benefits of stable high performance, zero-downtime linear scaling and hassle-free true high availability, with significant operational savings.

Redis Pack also augments Redis databases with the capability to use a combination of RAM and cost-effective Flash memory (a.k.a [Redis Flash](https://redislabs.com/products/redis-pack/flash-memory/)), retaining the same sub-millisecond latencies of Redis while storing larger datasets at drastically lower costs.

# Quick Links #

[Documentation for Redis Pack](https://redislabs.com/resources/redis-pack-documentation/)
[How To Guides for Redis Pack](https://redislabs.com/resources/how-to-redis-enterprise/)

# Quick Start with Redis Pack Container #

**_Note: This is a preview image for Redis Pack. The image is not intended for production use and only suitable for development for test purposes_**

Redis Pack is compatible with open source Redis applications. It is easy to try Redis Pack with your applications by simply running the container and setting up the Redis Pack Cluster. 

You can run this container in any operating system that is capable of running linux based containers including Linux flavors, MacOS and Windows based machines with Docker.

* **Step-1:** Start Redis Pack Docker container

`docker run -d --cap-add sys_resource --name rp -p 8443:8443 -p 12000:12000 redispack/rp`

* **Step-2:** Setup Redis Pack by `visiting https://localhost:8443` on the host machine to see the Admin Console. You may see a certificate error depending on your browser. Simply choose "continue to the website" to get to the setup screen. 

![setup screen](https://raw.githubusercontent.com/RedisLabs/DockerHub/master/images/RP-SetupScreen.jpeg)

* **Step-3:** Go with default settings and provide only a cluster FQDN: "cluster.local"

![setup screen](https://raw.githubusercontent.com/RedisLabs/DockerHub/master/images/RP-SetupScreen2.jpeg)

* **Step-4:** Click "Next" to skip the license key screen if you don't have a license key to try the free version of the product. On the next screen, set up a cluster admin email and password.

![setup screen](https://raw.githubusercontent.com/RedisLabs/DockerHub/master/images/RP-SetupScreen4.jpeg)

* **Step-5:** Choose the new redis db option. In the new redis db screen, click the "show advanced option" link and provide a database name _"database1"_, endpoint port number of _"12000"_ and click "Activate" to create your database.

![setup screen](https://raw.githubusercontent.com/RedisLabs/DockerHub/master/images/RP-DBScreen.jpeg)

You now have a redis database!

## Connecting to the Redis Database ##
With the redis database created, you are ready to connect to your database to store data.

* **redis-cli**: Read and Write Data using `redis-cli`

redis-cli is a simple commandline tool to interact with redis database. Use the following script to connect to the Redis Pack container, run redis-cli connecting to port _12000_ and store and retrieve a key.

```
docker  exec -it rp bash

# sudo /opt/redislabs/bin/redis-cli -p 12000
# 127.0.0.1:16653> set key1 123
# OK
# 127.0.0.1:16653> get key1
# "123"
```

* **Simple Python App**: Read and Write Data using Python

A simple python app running in the host machine can also connect to the _database1_ created Redis Pack container. The following section assumes you already have python and redis-py (python library for connecting to redis) configured on the host machine running the container. You can find the instructions to configure redis-py on the [github page for redis-py](https://github.com/andymccurdy/redis-py)

Paste the following into a file named _"test.py"_

```
import redis

r = redis.StrictRedis(host='localhost', port=12000, db=0)
print ("set key1 123")
print (r.set('key1', '123'))
print ("get key1")
print(r.get('key1'))
```

Run _"test.py"_ application to connect to the database and store and retrieve a key.

```
python.exe test.py
```

The output should look like the following screen if the connection is successful.

![python app](https://raw.githubusercontent.com/RedisLabs/DockerHub/master/images/RP-PythonAppScreen.jpeg)