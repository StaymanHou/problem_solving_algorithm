# TODO put all back together again after finalizing other chapters

module ProblemSolver
  def solve(problem, is_root_problem: false)
    while problem.unsolved? || problem.still_relevant?
      begin
        root_problem, desired_io = self.identify(problem)
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
        self.test_and_analyze(solution, desired_io, problem)
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

  # ! Good problem definition or framing can have a huge positive impact
  def identify(problem)
    check_domain_knowledge
    acquire_domain_knowledge
    root_problem = identify_root_problem

    desired_io = specify_desired_input_output_and_exceptions # or specify SMART goals and non-goals for non-tech problems
    if desired_io == nil
      raise UnknownDetected and GOTO acquire_domain_knowledge
      # could be known unknowns. e.g. I know I need to use a 3rd-party API, but I need to know its output before I can specify the output of my problem
      # or unknown unknowns.
    end
    return root_problem, desired_io
  end

  def build_solution(problem)
    
    generalize_TODO
    prototype_b # solve a simplified version of the problem
    borrow_code # when and how? make sure you understand the code
    one_at_a_time_a
    dont_be_afraid_to_break_things # except for production environment
    one_solution_vs_best_solution
    temporary_solution_vs_best_practice
    raise UnderstandingOfProblemOrSolutionUpdated if needed
  end

  # ! Decomposition gives us manageable chunks to work on and to see the structure of the problem
  def decompose(problem)
    return problem if problem.manageable?
    one_at_a_time_b
    if problem.is_to_write_new_code_or_modify_existing_code?
      return decompose_coding_problem
    elsif problem.is_to_debug_code?
      return decompose_debugging_problem
    elsif problem.is_to_come_up_with_a_tech_stack?
      return decompose_system_design
    elsif problem.is_to_troubleshoot_a_system?
      return decompose_system_troubleshooting
    else # it's more of a general problem
      return process_flow || components || options
      # read the book of McKensey to find more e.g. Factor / lever tree, inductive logic tree, deductive logic tree, hypothesis tree, decision tree
    end
    raise UnderstandingOfProblemUpdated if needed
  end

  # ! Focus your early efforts on the big levers that you can pull or the big risks / unknowns that you want to mitigate
  def prioritize(problems)
    create_dummy_outputs_and_get_feedback_to_align_expectations
    estimate_impact
    urgency_vs_importance
    pros_and_cons
    biz_vs_tech
    hotfix_vs_perfect
    balance
    agile do
      situation
      observation
      resolution
    end
  end

  def test_and_analyze(solution, problem, io)
    prune_or_grow_the_tree_as_i_learn_more
    manual_test
    automated_test_after_fact
    tdd
    regression_and_side_effects
    happy_path_and_sad_path
  end

  private

  ### Helper methods for problem identification start ###
  def check_domain_knowledge
    do_i_understand_the_problem? do
      can_i_envision_the_desired_input_and_output?
    end
    do_i_understand_the_current_situation? do
      can_i_tell_how_the current_system_or_codebase_works?
    end
    do_i_understand_the_building_blocks_of_the_solution? do
      can_i_breakdown_the_problem_into_smaller_pieces?
    end
    raise UnderstandingOfProblemUpdated if needed
  end

  def acquire_domain_knowledge
    domain_knowledge.each do |knowledge|
      if i_know_that_i_know
        return true
      elsif i_dont_know_that_i_know
        revisit_it_later_when_i_need_to_transfer_knowledge
        return true
      elsif i_know_that_i_dont_know
        learn_it_fast!
        or try_it! # esp. when I kinda know the solution but don't know how exact it solves the problem. e.g. 3rd-party libraries or service APIs
      elsif i_dont_know_that_i_dont_know
        if i_can_tell
          research
          Thread.new { complete_or_review_training } # not part of the problem lifecycle. Done during onboarding or professional development programs
        elsif i_cant_tell
          ask_for_mentorship_or_feedback
          Thread.new { study_adjacent_or_interfacing_fields } # not part of the problem lifecycle. Done as a personal routine
        else
          unforeseeable_future_development
          external_factors
        end
      end
      raise UnderstandingOfProblemUpdated if needed
    end
  end

  def identify_root_problem
    if problem.something_not_working_as_expected?
      clarify_the_expected_behavior # Rule out the case where it's a feature not a bug
      list_all_potential_causes
      create_hypothesis_for_likely_root_cause
      determine_the_info_required_to_test_the_hypothesis
    elsif problem.develop_a_new_thing
      identify_who_have_the_need
      empathize_with_them
      determine_if_there_is_a_different_need_and_require_solving_a_different_problem
    else
      ask_five_whys
    end
    raise UnderstandingOfProblemUpdated if needed

    how_far_is_too_far_and_which_root_problem_to_stop?
  end

  def learn_it_fast!
    clear_learning_objectives do
      prototype_a # TODO move this line to somewhere else. Some people easily assume they learned it and try to directly apply to the problem without verifing their learning by building a hello world prototype
    end
    1_10_100_principles
  end

  def research
    gpt_or_other_gen_ai
    google
    ask_an_expert do
      when_to_ask_TODO
      provide_enough_background_info
      stick_to_the_known_facts # Note: not my interpretations
    end
  end

  def study_adjacent_or_interfacing_fields
    learn_enough_so_that_i_know_what_problem_it_solves_and_how_to_look_up_more_info # Note: not how it solve the problem, nor the solution itself! Don't try to memorize it, let the computer do what it is good at.
  end
  ### Helper methods for problem identification end ###

  ### Helper methods for decomposition start ###
  def decompose_coding_problem
    understand_existing_logic if any_exists # Note: don't need to understand everything, just the big picture and the related parts. Poorly structured codebase or system can cause significant difficulty here
    design_new_logic do
      given_several_example_inputs_and_outputs
      develop_and_test_the_logic do
        walkthrough_the_examples
        write_down_the_steps
        find_patterns
        check_the_logic_with_the_examples
      end
      write_pesudo_code_or_draw_flow_chart # think in the logic not in any specific language. Although we do need to understand the constrains & paradigms of the language we will be working with
      check_pesudo_code_with_the_examples
    end
    translate_logic_to_code do # that's why we take courses and practice so that we can be sure we can translate logic to code with good accuracy
      scaffolding
      prototyping
      api_usage
      syntax
    end
    write_code_nicely do
      what_problem_does_it_solve?
      refactoring
    end
    write_performant_code do
      what_problem_does_it_solve?
      refactoring
    end
    write_secure_code do
      what_problem_does_it_solve?
      refactoring
    end
  end
  
  def decompose_debugging_problem
    # how to tell each of these
    wrong_expected_input_or_output?
    wrong_logic?
    logic_doesnt_fit_the constrains_or_paradigms?
    typo_in_code?
    syntax_error?
    wrong_usage_of_language_feature?
    wrong_usage_of_framework_feature?
    wrong_usage_of_3rd_party_api?
    bugs_in_3rd_party?
    wrong_understanding_of_how_existing_codebase_works?
    inherited_problem_from_existing_codebase?
  end

  def decompose_system_design
    in_house_vs_3rd_party
    evaluate_options do
      requirements_vs_capabilities
      cost
      resouces_required
      timeline
    end
    frontend do
      layout_and_styling
      templating
      view_model
      fetch
      state_management
    end
    backend do
      model do
        erd
        db_normalization
      end
      view
      controller
    end
    infra do
      web_server
      database
      other_middleware
      deployment
    end
  end

  def decompose_system_troubleshooting
    access_pattern_changed? do
      viral_traffic
      ddos
      application_logic_change
    end
    issue_introduced_into_application_code? do
      syntax
      logic
      performance
    end
    infrastructure_issue? do
      network
      cpu
      memory
      storage
    end
    dependent_3rd_party_service_issue? do
      service_down
      service_api_changed
    end
    misconfigured_malfunctioning_middleware? do
      web
      db
      cache
      os
    end
  end
  ### Helper methods for decomposition end ###

  ### Helper methods for prioritization start ###
  ### Helper methods for prioritization end ###
end

class Problem
  def manageable?
    TODO
    know_where_to_start?
    clear_objectives?
    confident_to_solve?
  end

  def still_relevant?
    return false if the_requester_no_longer_needs_it
    return false if requirement_changed
  end
end

solution_and_result = ProblemSolver.solve(Problem.new, is_root_problem: true)

lesson_learned = retrospect(problem, solution_and_result)
communicate(problem, solution_and_result, lesson_learned)
