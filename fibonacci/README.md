# Fibonacci Webapp

The goal is to use tests to drive the design of a web application that renders HTML, receives input, makes a request to a server, and displays a response from the server.

The HTML rendering is already wired up, so the only real work is to figure out how to test the remaining interactions with the server and the DOM.

## Hints

### AJAX

Example jQuery snippet for asking the server for the Fibonacci value at a given index:

    $.post('/fibonacci', {index: 21}, function(result){ console.log(result) })

Will log `10946` to the console.

Note that you can use Jasmine spies to isolate your test from the dependency:

    spyOn($, 'post') //prevent it from being called, will listen to interactions

    //Use the spy api for assertions
    expect($.post).toHaveBeenCalledWith(...)
    $.post.mostRecentCall.args //array of arguments called most recently

### HTML

You can use jasmine-fixture to easily place elements into the DOM to support your test. For instance:

    $resultBox = affix('.result')

Will add an element to the DOM with the class "result" and remove it after the test runs.