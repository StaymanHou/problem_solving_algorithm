# 1. Overview

In this chapter, we'll see the most foundamental principles of problem solving.

Before we get started, I'd like to introduce 4 different senarios that engineers face most often in their day-to-day work. We will use these 4 senarios as examples and see how we apply the principles, methods, and tips throughout this workshop.

## 1.1 Example Senarios

As you shall see, the senarios would have different level of uncertainty and complecity. As the difficulty gradually increase, you would need to incorporate more problem solving steps, apply more advanced techniques, and investing more efforts.

### Senario A. Implement a Relatively Simple and Standalone Piece of Code

> As a developer you are tasked to implement a portion of the payment module of a self-serve advertising system (think about something like Google Ads where users can place orders to launch their ad campaign on Google's platform). Suppose that each user has 3 balances, namely gift balance, debit balance, and credit balance (with a credit limit). Gift balance holds the dollar amount of the promos a user has claimed, such as new user coupons, or seasonal stuff (think about using a gift card). Debit balance holds the amount of money a user has deposited to the system which then he/she can spend it towards campaign purchases (think about using a debit card). Credit balance holds the amount of credits used towards campaign purchases where the due amount would need to be paid in a certain amount of time (think about using a credit card). The portion you are going to implement. Given the total amount of a requested campaign purchase (e.g. $1,000) and the current balances of the user (e.g. $100 gift, $500 debit, $0/$2,000), throw an error if the balances are not enough to make the purchase, otherwise, return the amounts need to be charged from each balance (e.g. $100 from gift, $500 from debit, $400 from credit).

### Senario B. Add or Change a Feature to a Website That You May or May Not Be Familiar with

> As a developer you are assigned to a new project and a new team. Still the self-serve advertising system mentioned above, but imagine you know nothing about the payment module. You are tasked to implement a feature to automatically send notifications whenever a payment is made via a Slack chatbot. You will be provided with a walkthrough of the codebase. Then it would be all up to you to complete the task. And what makes things worse is that you have little knowledge of the usage of 3rd-party libraries involved in this feature.

### Senario C. Troubleshoot a Web Application System When it's Down

> As a SRE/DevOps you are tasked to ensure the uptime & reliability of a high throughput news website and its underlining infrastructure. You've been introduced to the architecture of the system, and learned the basic functionality of the application. The application code itself is out of your jurisdiction, but you do have the access to read and, if necessary, modify the code. Suddenly you got an automated call to alert you of the fact that the website is not accessibly. You now need to fix the issue with some sense of urgency (as it's a very critical application to the business), and if possible, prevent it from happening again in the future.

### Senario D. Lead the Development of a New Application with Moderate Complexity That Also Involves 3rd Parties

> As a senior engineer / team lead, you are told that the business wants to step into the social media sector. The rough idea is to create an online platform in the form of a web app + a mobile app (think about Facebook, Twitter/X, Reddit) that targets a specific user segment. Now you need to turn that idea into a product.

## 1.2 Pseudo Code

TODO embed it here? or link to it if not possible

Let's take a look at this code

```ruby
solution_and_result = ProblemSolver.solve(Problem.new, is_root_problem: true)
````

The last line of the code is essentially the entry point. Here we are given a new instance of `Problem`. Pass it to the `ProblemSolver` to solve it where the `.solve` method encapsulates the actual logic of the algorithm.

This corresponds to our very first fundamental principle. **Problem-Oriented Mindset**.

Here we are also assuming that the given problem is the root problem by passing `is_root_problem: true`. We'll get to this topic later in chapter 3. There are a lot of cases where the problem presented to us may not be the actual / root problem we need to solve. Here let's just stick to the assumption that it IS the root problem.

```ruby
module ProblemSolver
  def solve(problem, is_root_problem: false)
    while some_condition
      begin
        # ...
      rescue UnderstandingOfProblemHypothesesOrSolutionUpdated > exception
        next
      end
    end
  end
end
````

The outermost part of the `.solve` method is a while loop which represents the iterative nature of problem-solving. As our attempt to solve the problem, our understanding of the problem or the solution will change, which may call us to go another round, and so forth and so on...

```ruby
module ProblemSolver
  def solve(problem, is_root_problem: false)
    while problem.still_relevant?
      # ...
      return solution
    end
  end
end

class Problem
  def still_relevant?
    return false if the_requester_no_longer_needs_it
    return false if requirement_changed
    return true
  end
end
````

Until a solution is accepted; Or some other condition has been met.

`return solution` will end the loop, representing the case where the problem has been solved.

`problem.still_relevant?` will also terminate the loop if it returns false, representing the other case where the problem solving process would be aborted.

This corresponds to our 3rd fundamental principle. **Exit Condition**. (I know that I just skipped the 2nd one, we will get to it shortly)

```ruby
module ProblemSolver
  def solve(problem, is_root_problem: false)
    while problem.still_relevant?
      begin
        if problem.manageable?
          solution = self.build_solution(problem)
        else
          subproblems = self.decompose(problem)
          solution = []
          subproblems.each do |subproblem|
            solution.append(self.solve(subproblem)) # !!! Recursion
          end
        end
        return solution
      rescue UnderstandingOfProblemHypothesesOrSolutionUpdated > exception
        if is_root_problem
          next
        else
          raise exception
        end
      end
    end
  end
end
````

`if problem.manageable?` When a given problem is manageable, we can easily come up with solutions without having to introduce an algorithm. However, as problems get more complicated, we will have to break it down to smaller pieces until they reach a manageable granularity.

`subproblems = self.decompose(problem)` and `solution.append(self.solve(subproblem))` represent that recursive process as we are invoking the `self.solve` method on the subproblem(s) within the `.solve` method itself.

```ruby
rescue UnderstandingOfProblemHypothesesOrSolutionUpdated > exception
  if is_root_problem
    next
  else
    raise exception
  end
end
```

The exception here represents the fact that there are cases we would need to exit the recursion and revisit the root or parent problem as we solve the subproblems. Sometimes by learning more about the problem as we solve it or part of it, we will need to adjust the way we break things down, or even overhaul the entire plan.

This recursive nature combined with the iterative nature mentioned above, I call it the 2nd principle of problem solving. **Hierarchical Thinking**

As we've walked through the pseudo code and pointed out the 3 principles, let's now dive deeper one by one.

## 1.3 Principle No.1 Problem-Oriented Mindset

> \[Quote\] Albert Einstein said: “If I had an hour to solve a problem I'd spend 55 minutes thinking about the problem and 5 minutes thinking about solutions.”

The very core of problem-solving is **PROBLEM** not "solving" or "solution". I've seen that happening so often that engineers rush into solving something but ended up wasting time solving the worng problem.

> \[Example\] One common mistake is that in the process of implementing or troubleshooting some feature, a developer would quickly read the error message and immediately copy & paste it into Google or ChatGPT hoping for a easy fix, believing that this error message is the problem he/she needs to solve. Sometimes it works out just fine, other times he/she can be misled into attempting to solve a problem that's not even there in the first place. It's important to pay attention to the error message, carefully read it, look at the context / the surrounding code, and make effort to understand it. BTW, I'm not saying we should not use Google or ChatGPT. The point is even by using these tools, what we are primarily looking for is to understand the error; And then the solution or the fix comes the next.

> \[Example\] Remember during my school days, I'd hand in my exam papers with confidence believing that I've got everything right, only to find out later that I've lost points because I thought I've got the easy or fancy solution but I actually didn't even read the problem right.

### \[Tip 1.3.1\] Set aside time to understand and evaluate the problem

Echoing the quote by Einstein. Understanding the problem at hand is crucial. The entire problem-solving activity is centered around the problem. Before you even start solving it, take some time, maybe read the problem statement twice, maybe talk to the person who requested, maybe take a walk and reflect on the problem. I'll just stop since again we will come back to this subject later in chapter 3.

### \[Tip 1.3.2\] Avoid solution-oriented mindset

Another common pitfall for engineers and even good engineers is that we tend to get too obsessed with building that "perfect" solution or indulge in the enjoyment or the Dopamine generated from the "solving" activity itself. Yes, we may have understood the problem well enough, but as we build the solution we must always think about how this solution is connected to the problem so that we don't solve the problem for the sage of the solution.

![FunnyProjectFailure](assets/SomethingDefinitelyGetsLostInTransit.jpeg)

This exactly illustrates how a misalignment betweent the problem and the solution can backfire.

Personally, I love solving puzzles and enjoy. That mental exercise just naturally generates happiness in me, I guess just like how physical exercise boosts Dopamine and many enjoys that. I do believe a lot of good engineers share the similar trait.

Likewise, I believe that to a lot of good engineers, craftsmanship is something we hold dear to our heart. And I believe that in a way it reflects the creative and systematic nature of the image of our creator God. Just like he created things according to their kinds, then looked at his creation and said it was good.

However, as much as I believe that this attitude is important to the success of an engineer, and that the pursuit for perfection is essential, making sure that your solution solves the problem, nothing more nothing less, and finding that balance is also critical in the practical setting. We will talk about this more in chapter 4.

> \[Example\] Image a colleague comes to you asking you to help him/her find the greatest number in a file. BTW, it's likely to be just a one-time thing. Let's say the following code is what you come up with.

```python
# Define a function to find the maximum number in an array
def find_maximum(arr):
    max_num = arr[0]  # Assume the first element is the maximum
    for num in arr:   # Iterate through each element in the array
        if num > max_num:  # If the current element is greater than the maximum
            max_num = num  # Update the maximum number
    return max_num   # Return the maximum number

# Define a function to input an array from the user
def input_array():
    n = int(input("Enter the number of elements: "))  # Ask the user for the number of elements
    arr = []  # Initialize an empty array
    for i in range(n):
        element = int(input(f"Enter element {i+1}: "))  # Ask the user for each element
        arr.append(element)  # Add the element to the array
    return arr  # Return the array

# Main function
def main():
    arr = input_array()  # Input the array from the user
    max_num = find_maximum(arr)  # Find the maximum number in the array
    print("The maximum number in the array is:", max_num)  # Print the maximum number

# Call the main function
if __name__ == "__main__":
    main()
```

See how organized this piece of code is! Seperating the logic into a few functions with all these comments. However, that's essentially an overkill. Remember you are just writing a script to help with a simple one-time thing. Who really cares whether the code looks nice or just like a piece of garbage as long as it does the job.

P.S. Of course, if you do this after the work hours simply for the purpose of practising your coding style that would be a different story, because you are then solving a different problem. And if you are working on some super innovative product like the first few generations of iPhone, that's a different story as well.

### \[Tip 1.3.3\] Keep track of the problem

The next tip which is conencted with the previous tip. One way to combat the solution-oriented mindset is to keep track of the problem. Keep asking yourself, what exact problem am I trying to solve as we make progress in the problem-solving. Evaluate the ROI of each step you take. Ask yourself how does this step contribute to the problem. We shall elaborate on this in the next section.

## 1.4 Principle No.2 Hierarchical Thinking / Recursive & Iterative Process

Now that we've learned the lessons from Einstein's quote, let's take a look at the other side. As much as he's an outstanding theoretical physicist and all true with his quote, he was solving a different set of problems than what we usually solve as software engineers. Here's a quote by ChatGPT that stresses the other side.

> \[Quote by ChatGPT\] Only by implementing a solution can we validate our grasp of the problem; And we learn more by doing than by simply thinking about a problem. 

### \[Pattern 1.4.1\] Hypothesis > Verify > Learn > Pivot

As much as it's important for us to make the effort to understand the problem and center our solving approach around it, our perceiption of the problem can always be biased. We learn more about the problem as we try to solve it and even sometime even by putting together a wrong solution. Therefore, problem solving is an iterative process. Until our solution is proven, we always live with assumptions. Assumptions of the prblem. Assumptions of the breakdown. Assumptions of the solution and its components. This iterative process brings us closer and closer to the real problem and the real solution as we validate or correct our assumptions. We should not just get fascinated by the high-level and absctract stuff to the point where one become impractical or idealistic. Problem solving = hypothesis > verify > learn > pivot. The faster you can iterate, the faster you can solve the problem.

### \[Pattern 1.4.2\] Recursion / Decomposition and Synthesis

Looking at another dimension, problem solving is also a recursive process. We decompose a bigger problem into pieces. Then into smaller pieces. Then into even smaller pieces. Until it's something actionable to us. At the same time, we need to know how to trace back. Knowing that how this small detail fits into the bigger picture. Knowing which level granularity to retract to when our understand has iterated. And when we arrive at the solutions for each smaller component, we would eventually also need to piece everything together backup.

As the famous saying goes...

> \[Quote\] Think globally, act locallly

Problem solving has this bypolor nature. It requires us to pay enough attention to the details, take things apart, and take concrete actions, while having our eyes on the big picture, the root problem we are trying to solve. I call it **Hierarchical Thinking**. Good problem solvers would be constently going into and out of the hierarchical structure of a problem, or shall we say going up and down the stack.

Just like we've already mentioned in the previous tips. Yes, we need to act locally, but don't get trapped in a rabbit hole and lose the big picture.

> \[Example\] So often we see programmers get trapped in little details. For instance, spending hours investigating one possible common cause of an error (which usually learned from Google or ChatGPT) not realizing that there could be another reletively rarer cause.

> \[Example\] Let's say a developer is building a to-do list app. One feature involves displaying tasks in alphabetical order. The developer starts researching complex sorting algorithms like quicksort or merge sort, which are excellent for massive datasets. Meanwhile, he/she overlook two simpler solutions for the problem. a) Built-in sorting. Most programming languages have built-in sorting functions. b) Simple sorting for small data. For a tiny list (like 10 items), a simple sorting algorithm like insertion sort might be perfectly adequate. It's easy to understand and implement, and for such a small dataset, the performance difference between fancy algorithms and a simple one is negligible.

### \[Pattern 1.4.3\] Tree Traversal

When we put these two dimensions together, the process of problem solving is essentially growing, pruning, and growing, and pruning, a tree, over and over again. We start with the problem itself as the root (sometimes the root will also grow but that's for later). It branches out as we decompose the problem into subproblems in the form of steps, options, factors, hypotheses, and etc one level after another. Add or prune branches as we learn. Maybe some branch turn out to be not feasible. Maybe another branch is superior. The tree shrinks and grows back, until we either reach an absolute dead end, or all branches reach leaves.

![](assets/problem-tree-example-1.jpg)
> Source: Bulletproof Problem Solving: The One Skill That Changes Everything

If you've leanred data structure and algorithm, you will be able to tel that this is essentially tree traversal problem. Of course, depending on the nature of the problem at hand as well as our experience and skills, the type of the tree may vary greatly. That in turn will call for different type of search strategies like depth-first search (DFS) and breadth-first search (BFS). What's the optimal strategy you ask? There's no one size fit all. We shall investigate into this in chapter 7.

## 1.5 Principle No.3 Exit Condition / Know When to Stop

One more thing that we must talk about before we wrap up this chapter. We talked about the problem-oriented mindset. The problem-solving approach must be centered around solving the **PROBLEM**. We talked about that problem-solving is essentially an **interative** and **recursive** **tree traversal** process which demands **hierarchical thinking**. Now then, how do we know that we are done? When shall we stop?

There are basically two cases. The problem is solved, and we are done. Or the problem is no longer relevant, and don't need to solve it anymore.

### \[Checklist 1.5.1\] How do I know that the problem has been solved?


pass test
communicate
fit into the bigger piece

you can never know for sure

Problem solved

### \[Checklist 1.5.2\] How do I know that the problem is no longer relevant?

return false if the_requester_no_longer_needs_it
return false if business_priorities_changed_and_the_problem_is_postponed
return false if the_desired_outcome_is_obsolescent
return false if failed_to_validate_the_demand
return false if requirement_changed or understanding_of_the_requirement_changed
return false if learned_that_the_solution_is_no_longer_feasible_or_viable
return false if superior_solution_discovered

[< Home](README.md) | [Next Chapter >](2_main.md)
