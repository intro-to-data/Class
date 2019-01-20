# Lecture
- Counting _IS_ Hard
    - Two aspects to counting:
        1. The definition part.
        2. The implementing part.
    - This course is more about implementation than definition, but
      getting the definition right _is_ important.
    - Example: Identifying people with depression.
    - Congrats - now you have a definition. NOW you have to count
      them!
    - DATA MANAGEMENT is the science of counting things and not losing
      track of the important details.
    - And, frankly, IT IS HARD.
- Introducing: Analytical Workflow
    - Two Basic Steps
        - Data Management: You will spend MOST of your time here
        - Data Analysis
            - Includes visualization
            - Modeling
            - Inference
            - Etc.
        - Yes - sometimes these two steps mix.
    - Step 1 - Data Management
        - Import
        - Tidy
            - This article is both really interesting.
            - And a bit dense.
            - It is also original in that he is thinking about the thing
              analysts spend MOST of their time DOING: Managing their datas.
        - Transform
    - Step 2 - Data Analysis
        - Visualize (EDA)
        - Model (Regression, etc)
        - Story-telling!

# Lab: Dumb and Happy
- Use data from Cards Against Humanity!
    - [https://thepulseofthenation.com/#top](https://thepulseofthenation.com/#top)
    - I will provide a tempalte file to help.
- Data Management Process
    - Import data:
        - CSV
        - Excel
    - Tidy
    - Transform
        - `filter()` via indexing/dplyr
        - `arrange()`
        - `select()` 
        - `mutate()` 
        - `summarise()`
        - `group_by()`
        - `%>%`
    - Functional Composition v Pipe
- Group Project
    - Create 3-4 groups. Each group is assigned one of the dumb
      questions. They are then to show a factor or two which correlate
      with their question. 
    - Goal - Tell the class a story. Use Word or Powerpoint, etc. to tell
      your story. Don't use Excel. Your calculations/graphs need to come
      from R.
    - This should be much fun.
    - Question/Answers: What would you like to know how to do that you
      don't yet know how to do?
