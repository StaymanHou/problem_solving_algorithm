# 2. The 6-Step Approach - The Problem-Solving Framework

## 2.1 Intro

We talked about the model and the principles of problem-solving. In this chapter, we will now introduce the 6-step problem-solving process. Keep in mind that problem-solving is an iterative & recursive process. So in the real world, you would be jumping between steps in a quite arbitrary order except that it always starts with identifying the problem. You won't be simply executing these 6 steps in a linear fasion and can it a day. We shall look at an example after we walk through these steps.

Here we outline the 6 steps first.

- Identify Problem
- Decompose
- Prioritize
- Build Solution
- Test & Analyze
- Retrospect & Commuinicate

TODO insert image here

## 2.2 Pseudo Code - The Main Workflow of Problem-Solving

Let's again review the pseudo code which has evolved since last chapter. As we do so piece by piece, we will briefly explain what each step is about before we dive deeper in the up-coming chapters.

TODO embed code here

## 2.3 Identify Problem

```ruby
root_problem = self.identify(problem)
if problem != root_problem
  is_root_problem = false
  return self.solve(root_problem, is_root_problem: true)
end
```

The first step is to identify the problem. Remember the first principle we laid out in the previous chapter? Problem-oriented mindset! And part of that mindset is to form the habit of always identifying the problem first. Depending on the problem, your experience, and the context, this step may be simple, it may also be super complicated. The objective of this step is to have a clear understanding to our best effort. What exactly is the problem? Who are we solving it for? What value will a solution deliver? Is there a cause or deeper problem behind it? As indicated in the conditional clause, if there's a problem behind the problem at hand, we may want to consider pivot and solve that problem instead as the root problem. Please also note that there might be yet another problem behind that root problem. Hence a recursive & iterative process. This connects to our second principle, hierachical thinking.

> \[Example\] The immediate issue you see: Laundry is piling up because the washer takes long to wash 1 load. The immediate solution might be resetting the washer, checking the cycle, and trying a new cycle. With further investigation, you might discover that the washer is taking a lot of time completing a cycle because there's a drainage issue. The water is draining very slowly. This may require you to check the drain hose for clogs. Maybe need to clean it or remove any objects blocking the flow. If we dig a little bit more, we may find the root cause of this problem. The drain hose is clogged because of poor maintenance habits. And the solution is to clean the drain hose regularly.

This is just one aspect of problem identification. We are just using this example to showcase how a different udnerstanding of a problem can easily lead to different solutions, and sometimes ridiculous ones, actually more common than you might think. We will learn more in Chapter 3.

# Decompose

Okay, now that we are clear about the problem and have made sure that we are not trying to solving the wrong problem. The next step is to decompose the problem.

```ruby
if problem.manageable?
  # ...
else
  subproblems = self.decompose(problem)
  # ...
  sorted_subproblems.each do |subproblem|
    solution.append(self.solve(subproblem))
  end
end
```

Part of the decomposing a problem is actually to decide if I need to decompose it as indicated by the `problem.manageable?` condition.

> \[Example\] I'd assume all the reader would be able to immediately solve this problem. `1 + 2 + 3 + 4 = ?`. The solution is pretty obvious which is 10. However, imaging for a 1st grade kid, this problem can be overwhelming for them. So it will be necessary to decompose it into 3 problems. First, `1 + 2 = ?`. The solution is 3. Then `3 + 3 = 6`. And lastly `6 + 4 = 10`.

Depending on the problem, your experience, and the context, the decomposition of the problem and its structure can be as simple as a single node, or a very complex tree. With a simple problem, we can just solve it without having to decompose it. Whereas for a more sophisticated problem, we will need to divide and conquer. We will learn more about when and how to decompose a problem in Chapter 5. And we shall see several common patterns.

# Prioritize

The immediate thing that needs to happen after a problem is decomposed is to prioritize the subproblems

```ruby
sorted_subproblems = self.prioritize(subproblems)
```

Human beings are not design for multi-tasking like the modern-day multi-core CPUs do. Likewise, teams are always going to lack resources. On top of that, some subproblems may have dependencies. In the previous example, a kid must solve `1 + 2` before he/she can tell that the next problem is to solve `3 + 3`. Therefore it's almost impossible to be able to tackle all subproblems at once. Then the question would be, which subproblem shall I solve first? We've noted that problem-solving is essentially a tree traversal problem itself. Then what's the best strategy to travese, grow, and prune this tree as we identify the problem & its root, decompose it into subproblems, and explore solutions?

> \[Example\] Pretend that a kid first decomposed the `1 + 2 + 3 + 4 = ?` into 3 possible subproblems `1 + 2`, `2 + 3`, and `3 + 4`. (Assume the kid has not learned the commutative law of addition hence not realizing that `1 + 4` is also a valid subproblem.) It should be obvious that we should prioritize solving `1 + 2` and `3 + 4` in this case, because if we can manage to solving these two, the subproblem `2 + 3` will become irrelavant. Therefore, we should not waste time upfront solving this subproblem.

This is probably not a good example, but in solving real-world problems, the prioritization can be much more ambiguous. Depending on the nature of the problem, the relationship between the subproblems, and together with the unknowns, prioritizing these can be hard. We will discuss some common strategies in Chapter 6.

# Build Solution

```ruby
if problem.manageable?
  solution = self.build_solution(problem)
else
  # ...
end
```

Once we broke down a problem into a comfortable level of granularity, we may then proceed with building the solution. Now, building a solution can involve all sorts of different things. Building a website requires utilizing tools that would be very different from building a web crawler. We won't discuss about how we specifically use tools and build stuff as it's out of the scope of this workshop. In fact, that's something has been already extensively covered by other open or paid courses and tech bootcamps. Our goal in this workshop is to identify several patterns as well as anti-patterns in this step, especialy in this recursive & iterative context. For example, while we piece together this small puzzle, making sure that this solution later will contribute to the bigger puzzle without lossing the big picture.

# Test and Analyze

```ruby
self.test_and_analyze(solution, problem)
```

After a solution is built whether for a subproblem or a root problem, we must assess how well it solved the problem. Based on that, we then decide whether we should iterate and how. Analyze the results and the remaining gaps. Improve our understanding of the problem and the solution. In Chapter 7, we will explore the common pitfalls and tips related to this step. A quick note. When we talk about test, plz do not immediately connect it with writing automated tests in the context of programming. It's just one form of assessing the outcome. You may not even realize that might have been doing this already. On the other side, you may not realized that you might not be doing it frequently enough.

# Retrospect and communicate

```ruby
lesson_learned = retrospect(problem, solution_and_result)
communicate(problem, solution_and_result, lesson_learned)
```

This is the last step. After a solution has been built and tested, reviewing your approach can great speed up your growth, especially when you've solved a new problem or subproblem that's you've never come across before, or never put your knowledge in pratice. In the pseudo code, I've left this step outside of the loop for simplicity, however sometimes it can even make sense to conduct a mid-term retrospective in that iterative cycle. In that case, it can take different forms such as regular check-ins or project milestone reports.

That brings us to two common mistakes at engineers often make during their early careers. One is neglecting the need for retrospectives, believe that his/her task is simply completing the task itself or believe that he/she can grow naturely by completing tasks one after another. As much as it's true that problem-solving requires a problem-oriented mindset, and we should focus our effort on the problem. However, for engineers, learning and growing to be better problem-solver is always a long-term side quest. Therefore, it's worth doing so as long as the situation permits it.

The second misconception is believing that communicating the solution and result is an optional thing for engineers. A lot of good engineers tend to value the actual result a lot, which is good, but neglect the need to communicate the result. Many of us are pragmatic, practical, and focus on delivering the actual outcome. (Compared to those who just fake the results, or just do the fancy talks). The other side of the fact, though, is that value is only fully fullfilled when the other party receives it, whether that's a user, a client, a stakeholder, or a supervisor. That misconception combined with introversion (research examining the introversion of software engineers consistently reveals a higher percentage) and part of Christian belief (that God see our deeds and ultimately he decides our value), easily lead engineers not to put enough emphasis and enough to communicate their works. Therefore, I want to specifically highlight this step, not to get approval or praise by man, not to take shortcuts, but to deliver the value to its full potential.

These 2 topics are covered more in details in other workshops, but we shall still touch on these in Chapter 8.

## conclude

6 step each node

pivot, random order

examples

5 + 4 * 3 ^ 2 = ?

Scenario A


[< Previous Chapter](1_overview.md) | [Next Chapter >](3_identify_problem.md)
