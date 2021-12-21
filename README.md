# ruby_connect4

TDD exercise to create a CLI Connect 4 from The Odin Project's Ruby track.

# Reflection
This project was particularly tough for me because of utilizing the TDD approach. Here are the challenges I had and things I can continue to work on:
* Testing behaviour vs testing implementation. Some implementation testing will be inevitable, but I found sometimes that I was gravitating towards implemntation tests where I am often better off testing for behaviours I want. A good example was my initial implmentation of the `Connect4#show_rules` test. I initially was testing for the return of the spcific message, but then I realized that all I should be testing was that the message was sent properly.
* I found that even though I was explicitly working on TDD, I still often drafted my test setup, then worked on code and then implemented tests of that code. I could do better to utilize the red-green-refactor method. I think this will take some practice to break.
* I found this project helpful in thinking about how to integrate and prepare larger projects.