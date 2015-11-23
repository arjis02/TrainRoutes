Problem One: Trains

Design:

I created three classes to handle the different inputs(Route, DirectRoute, and Trip). 

The DirectRoute class takes in the initial inputs along with their distances. Here you can set up the entire system. I decided to create a separate class for this so that the creator of the train routes can specify a new direct route if ever created. This DirectRoute inherits the basic attributes of the Route class. 

The Route class emcompasses all of the possible routes the train can take to reach a specific destination. This includes DirectRoutes, as well. This can handle an input with all the stops along the way to the final destination. It also has methods to calculate the total distance given all the stops in between the origin and destination.

The Trip class is designed to do all calculations necessary to give useful information about a specified trip. It only needs to be initialized by an origin and a destination. In the Trip class, they can be one in the same. This class contains methods for determining best possible routes, as well as specific case scenarios.

This particular design allows for high flexibility and reusability when new features need to be added. The methods are designed to handle one task. And the names of the methods indicate exactly their use purpose. 


Instructions:

At the bottom of the page, you will see a section for the INITIAL ROUTES. This is done to set up the Direct Routes. This must always be done first. 

Then, the next set of variables starting with the word "route" can test to make sure the Direct Routes were set up correctly. Here, you can create a new route with all of the intermediary stops and test to see if the distances add up as expected.

Finally, you can create the Trips you need information on. Simply create a trip with the origin and destination in one string. And run methods like "trips_with_exact_stops(num)" or "num_of_trips_with_max_stops(num)". All of the tests given pass. I also included an edge case test to see if it will recognize that there is a Direct Route to the destination.