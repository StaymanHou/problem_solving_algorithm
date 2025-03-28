<sub>v0.1</sub>

# 5. Decompose

## 5.1 Manageable (sub)problems

Granular enough (no more / no less) to solve the problem at hand

[Example 1] Scenario: Building a simple login functionality.

Too Granular:
- Task A: Create the login page HTML.
- Task B: Create a form container.
- Task C: Create the username input field.
- Task D: Create the password input field.
- Task E: Write a function to capture keystrokes for the username field.
- Task F: Write a function to capture keystrokes for the password field.
- Task G: Validate each keystroke individually.
- Task H: Create a submit button.
- Task I: Write a function to format the user credentials.
- Task J: Write a function to send credentials to the server.
- Task K: Write a function to handle server responses.
- Task L: Write a function to display errors.

[Example 2] Scenario: Processing an order in an e-commerce system.

Too Coarse:
- Task A: Write one monolithic function called `processOrder` that:
(Reads the order details. Validates user input. Calculates the total price. Applies any discounts or promotions. Updates inventory. Sends a confirmation email. Logs the transaction.)

Rules of thumb
- Is this task simple enough for me without feeling **overwhelmed**?
- Can I easily verify this task
- Can this task be completed with minimal reliance on others?
- Is there an existing library?

Also refer to Yitang PM course - Just granular enough so that you can be confident that the R person can reliably solve it. In this case the R person is yourself.

[Exmaple] 1+2+3+4 (depending on the person) | Also refer to Yitang PM course

## 5.2 One at a time

(Slightly different angle from previous chapter)

- Avoid Overwhelm
- Milestones or Checkpoints (confirm completion before moving on to the next)
- Timeboxing (prevent spending too long on one piece)

Refer to the previous chapter

======== Common Frameworks ========

If don't know how to break down? => Known-unknown => Learn => 1:10:100

Ultimately, these frameworks are one of the core competencies that we need to delibrately practice.

## 5.3 Coding

(Inspired by https://www.coursera.org/specializations/object-oriented-programming)

### 5.3.1 Understand existing logic

Before changing or adding new functionality, invest time in reading and running the existing code. Try to understand how data flows, which modules interact, and what assumptions the code makes.

Tools & Techniques:
- Code walkthroughs
- Read existing unit/integration tests if present.
- Check existing diagrams or flowcharts if present. Or create diagrams or flowcharts if needed.

### 5.3.2 Design new logic

Sketch Your Approach: Before writing code, sketch out your algorithm or module design. Use **pseudocode** or **diagrams** to clarify the logic.

### 5.3.3 Translate logic to code

Take the logic from previous step and implement using the actual programming language

#### 5.3.3.a Scaffolding

Think of scaffolding as setting up the temporary structure that supports the final build—like creating directories, empty classes or functions, and basic project configuration.

Helps verify that your development environment is set up correctly. Ensures that dependencies and integrations (APIs, language features) are correctly installed and configured.

Tip:
Write placeholder functions with clear signatures and add simple tests to check that the scaffolding works before fleshing out full logic. (Fake it before you make it)

#### 5.3.3.b Try a working example / Hello world

(Validate API usage / language syntax)
Before diving deep into the new logic, write a small working example (or a “Hello World” equivalent) that exercises key parts of your design if you are not familiar with it.

This step helps you validate that you're correctly using the language, frameworks, or APIs. It’s like taking the scaffolding for a test run to ensure it’s solid.

Incremental Development:
Start small, then incrementally add more logic once the basic structure is verified.

[Example] Me trying LLM fine-tuning this week

### 5.3.4 Refactoring

After your code works, it's time to refine it. Refactoring is about cleaning up and enhancing your code without changing its functionality.

- Readability & style
- Maintainability
- Reduce complexity
- Enhance flexibility
- Improve performance
- Security
(Design principles & patterns)

#### 5.3.4.a Naming conventions

Clarity is Key:
Choose names that clearly describe the purpose of variables, functions, and classes. For example, prefer `calculateTotalPrice()` over `calcTP()`.

Consistency:
Follow established naming conventions (camelCase, snake_case, etc.) as agreed by your team or language community. Can be enforced using lint tools.

#### 5.3.4.b When to comment

Explain the "Why":
Comments should **add context that isn’t obvious from the code itself**. For instance, if a particular algorithm was chosen for its performance under certain conditions, document that decision.

Avoid Redundancy:
Don't comment on every single line. Instead, focus on non-obvious logic, complex operations, or decisions that might be revisited later.

Update Regularly:
Make sure comments remain relevant and updated as code changes. Outdated comments can be misleading.

Document Assumptions & Constraints:
If there are any assumptions or known limitations, document them right where they matter.

### 5.3.5 [Bonus] Testing

TDD vs. Testing After the Fact

## 5.4 Debugging

### 5.4.1 Wrong expected I/O

### 5.4.2 Wrong logic

### 5.4.3 Logic doesn't fit the constrains or paradigms

### 5.4.4 Typo in code

### 5.4.5 Syntax error

### 5.4.6 Wrong usage of language feature

### 5.4.7 Wrong usage of framework feature

### 5.4.8 Wrong usage of 3rd-party API / library

### 5.4.9 Bugs in 3rd-party

### 5.4.10 Wrong understanding of existing codebase

### 5.4.11 Inherited problem from existing codebase

### 5.4.12 [Bonus] Race Condition

## 5.5 Design Tech Stack

### 5.5.1 Build vs buy

#### How to evaluate

### 5.5.2 Web / Mobile

#### 5.5.2.a Frontend

#### 5.5.2.b Backend

#### 5.5.2.c Infra & Ops
(CI/CD)

## 5.6 Troubleshooting System

### 5.6.1 Access pattern changed

### 5.6.2 Issue introduced into application code

### 5.6.3 Infra issue

### 5.6.4 3rd-party service issue

### 5.6.5 Middleware

## 5.7 Other General Decomposition

### 5.7.1 Process flow (this THEN that)

### 5.7.2 Components (this AND that)

### 5.7.3 Options (this OR that)

### 5.7.4 Other

## 5.8 Conclusion: Low-cost trial and error

[< Previous Chapter](4_build_solution.md) | [Next Chapter >](6_prioritize.md)
