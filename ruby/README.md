# Ruby Examples

### Using the Password Grant REPL

1. Enter `[YOUR CLIENT SECRET]`, `[YOUR CLIENT ID]`, `[YOUR EMAIL]`, and `[YOUR PASSWORD]`.
2. Enter `[YOUR DEVICE IDENTIFIER]`, something like `My MacBook Pro`.
3. Run the stunt REPL using `ruby password_grant_REPL.rb`
4. From within the REPL, your requests will be made against the `token` method
  - `$ get("workspaces.json")`