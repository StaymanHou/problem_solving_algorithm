module ProblemSolver
  def solve(problem, is_root_problem: false)
    while problem.still_relevant?
      begin
        if problem.manageable?
          solution = self.build_solution(problem)
        else
          subproblems = self.decompose(problem)
          sorted_subproblems = self.prioritize(subproblems)
          solution = []
          sorted_subproblems.each do |subproblem|
            solution.append(self.solve(subproblem))
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

class Problem
  def still_relevant?
    return false if the_requester_no_longer_needs_it
    return false if business_priorities_changed_and_the_problem_is_postponed
    return false if the_desired_outcome_is_obsolescent
    return false if failed_to_validate_the_demand
    return false if requirement_changed or understanding_of_the_requirement_changed
    return false if learned_that_the_solution_is_no_longer_feasible_or_viable
    return false if superior_solution_discovered
    return true
  end
end

solution_and_result = ProblemSolver.solve(Problem.new, is_root_problem: true)
