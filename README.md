# Swift Async/Await: Unhandled Errors in Task

This example demonstrates a potential issue with error handling when using async/await in Swift. The `fetchData` function handles network errors correctly. However, if an error occurs before the `await` call in the `Task`, it's not caught by the current `catch` block.  This could lead to silent failures or unexpected application behavior.

The solution shows how to improve error handling to reliably catch all potential errors.