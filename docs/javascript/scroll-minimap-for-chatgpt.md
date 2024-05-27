

# Scroll minimap

Existing/similar chrome extensions:

* https://github.com/Brian-Gaffney/Chrome-minimap (does not work)

* https://github.com/chintown/monocle (works but not for chatgpt chat)


Useful libraries:

* https://html2canvas.hertzen.com/documentation.html


* html2canvas too difficult to implement :p copy html directly into minimap


Steps Taken: 
* When you scroll on chatgpt.com, you are not scrolling the whole page but instead scrolling through a div. Copying over the websites full html will not work

![](../assets/chrome-extensions/first-attempt.png)

* Instead copy over the container containing just the chatmessages.
Do this by using the selector `'[data-testid^="conversation-turn-"]'` to target chatmessages and then call `.parentNode`:

```javascript
sourceElements = document
    .querySelector('[data-testid^="conversation-turn-"]')
    .parentNode
```
![](../assets/chrome-extensions/second-attempt.png)

* Now we should add a blue rectangle overlay which shows where we currently are

## Scroll bar
