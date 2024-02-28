module ProblemSolver
  def solve(problem, is_root_problem: false)
    while problem.unsolved? || problem.still_relevant?
      begin
        root_problem = self.identify(problem)
        if problem != root_problem
          is_root_problem = false
          return self.solve(root_problem, is_root_problem: true)
        end
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
        self.test_and_analyze(solution, problem)
      rescue UnderstandingOfProblemHypothesesOrSolutionUpdated > exception
        if is_root_problem
          next
        else
          raise exception
        end
      end
    end
  end

  def identify(problem)
    
  end

  def build_solution(problem)
    
  end

  def decompose(problem)
    
  end

  def prioritize(problems)
    
  end

  def test_and_analyze(solution, problem)
    
  end
end

class Problem
  def manageable?
    
  end

  def still_relevant?
    
  end
end

solution_and_result = ProblemSolver.solve(Problem.new, is_root_problem: true)

lesson_learned = retrospect(problem, solution_and_result)
communicate(problem, solution_and_result, lesson_learned)
