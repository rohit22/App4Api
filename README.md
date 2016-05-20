# App4Api

## About
This repository contains the front end for the APP4API application developed for Digital Social Science Center at Columbia University. The goal of this code is to provide a web interface for the backend code developed in java. This front end is developed using java, jsp, css, and html. The basic template is inspired from W3 layouts. Each code contains couple of lines at the top that talk about the utility of the code. The code and the interface is very minimalistic. The project is a maven dynamic web project and hence all the dependencies are pulled from the maven repository. The only dependency that is has to be added is from the GeoCodeAPI repository. The jar generated from that repository has to be included in the build path of this file and the entire project can be run in Tomcat.

## How to use this application?

In this section, we describe the basic outline of one workflow which is simlar to both general and preset cases. As mentioned earlier, the APIs that this application supports are accessed through URL only, for example

**https://api.what3words.com/position?key=[KEY]&lang=en&position=51.521251,-0.203586** 

and the output is always a json object, for example

**{"words":["index","home","raft"],"position":[51.521251,-0.203586],"language":"en"}**.

In the given example, the user might be interested in the 3 words returned by the api and user has a csv file with the position co-ordinates in one single column. The user should first form a sample url that can be used to call the API (in the given example, the user should generate his own key and then plug it in the url). Generally, the sample url is given in the documentation of the API. After forming the sample url, the user can use it to select the parameters that change for every request from among the input parameters. In general, for the example given the 3 input parameters are *key*, *lang*, and *position*, the only parameter that changes with every request is *position* and the other 2 parameters are constant for a particular user. The csv file that the user uploads should contain one column for each of the input parameters that he selects. Through the application, the user should enter the column numbers for each of the parameters and upload the csv file. The user should also select the output parameters that he is interested to from the list of the output parameters displayed. 

## Presentation
A final presentation was made on this application at the Digital Centers Intern showcase. The slides of the same can be found at [slides] (https://docs.google.com/a/columbia.edu/presentation/d/1kKKO3qvJ4KAkEQh1gG5j42qJvrwbdD1_1AYfllNh8Wg/edit?usp=sharing)

## Contact
This documentation should help in exploring the project. In case of any questions, feel free to reach out to Digital Social Science Center at Columbia University.

