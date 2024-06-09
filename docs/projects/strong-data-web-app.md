# Strong data web app

This project uses the python scripts used in the gym data analysis project to create a web dashboard. Good opportunity to combine data and web dev skills together.


## Existing projects

Project | github
-|-
[StatLift](https://statlift.streamlit.app/) | [Source](https://github.com/jjaju/statlift/blob/main/statlift.py)
[strongappanalytics](https://strongappanalytics.web.app/) | [Source](https://github.com/AlexandrosKyriakakis/StrongAppAnalytics)


Observations: 

* Both projects provide good graphs but nothing on workout frequency or heatmaps.

* [streamlit](https://streamlit.io/) provides an easy way to create a web app from python data

* strongappanalytics uses javascript to process and visuallise the data on the client side. (But they also have a python script in the repo?) If I were to reuse python code from my previous project I would have to create a backend server and handle requsts there.

* If i use stream lit to create the web app, deployment and frontend would be done for me. I would only have to work with python. 


## Working out

### Plan
* Clone statlift and build on top of it using streamlit.
* Add the heatmaps and other graphs 

Useful Links:

* [https://discuss.streamlit.io/t/display-a-created-heatmap-on-my-web-app/40126](https://discuss.streamlit.io/t/display-a-created-heatmap-on-my-web-app/40126)

* [statlift fork](https://github.com/Aebel-Shajan/statlift)

There is an error with how statlift calculates workout durations