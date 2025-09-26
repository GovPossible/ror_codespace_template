# AGENTS.md – Project Guide for Coding Agents

## What to build
- Rails app with Tailwind UI. Favor generators and small vertical slices.

## How to run
- Dev: `bin/rails server` (port 3000). CSS built by Tailwind via npm scripts.
- Test: `bin/rails test`.

## Conventions
- Use partials in `app/views/shared` for cards, buttons, flash.
- Keep controllers skinny; push logic into models or POROs

### Development Notes
- Use Standard Ruby for code formatting (not RuboCop)
- **IMPORTANT**: Only run linting on files you've modified, never the entire codebase
- Test coverage is comprehensive - always add tests for new features and ensure they and all system tests pass before considering a task complete
- Method and class arguments should always be named (i.e. `def do_this(something:, another_thing:)` not `def do_this(something, another_thing)`)

### Code Organization and Namespacing

**Use double colon (::) notation for ALL namespacing** - This ensures consistency across the entire codebase:

**Required Pattern for ALL Code (Controllers, Models, POROs, etc.):**
```ruby
# Controllers - use double colon notation
class AccountsPayable::BillsController < ApplicationController
end

# Models - use double colon notation
class AccountsPayable::Bill < ApplicationRecord
end

# POROs - use double colon notation
class UtilityManagement::Meter::EndpointCollector
end
```

**Important:** ALWAYS use the double colon (::) notation for namespacing. Do NOT use nested module blocks.


**Directory Structure:**
- `/app/controllers/accounts_payable/bills_controller.rb`
- `/app/models/accounts_payable/bill.rb` 
- `/app/views/accounts_payable/bills/`

**When to Use Namespacing:**
- Related functionality with 3+ models/controllers
- New feature areas or complex domains
- API versioning (portal/v2, webhooks/v1)
- Administrative functions

**When Flat Organization is Acceptable:**
- Core domain models used throughout the app (Business, License, Contact)
- Simple utility classes
- Existing legacy code that works well

**Routing:**
```ruby
namespace :accounts_payable do
  resources :bills
  resources :payments
end
```
**Default Styling Applied:**
- Follow default Tailwind UI conventions whenever possible
- All fields are responsive and follow the design system

**Important:** Never create forms without TailwindBuilder unless there's a specific requirement for custom styling.

## Code Design Principles

### Object Design
- **Avoid using service objects.  Whenever possible instead use POROs in the style of Sandi Metz and POODR to represent a new object and appropriately namespace it into the project**

### Controller Design
- **Always use CRUD actions in Rails controllers. When deciding between a customer controller action and a new controller and standard CRUD actions, create a new controller that's appropriately namespaced and use the standard CRUD action**

## Work Tracking

### Workflow Documentation

- As we complete each task ask me for feedback and append a summary of the work done and my feedback to a
  /history/claude-history-%YYYY%mm%dd.md as a summary of work we've done each time

## Development Best Practices

- **Schema and Migration Review**
  - Before looking at schema or migration files, check the class for attribute implementation comments at the top that
    were built using the annotate gem
