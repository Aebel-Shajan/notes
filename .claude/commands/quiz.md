Generate an interactive quiz for a topic in this notes site.

## Instructions

1. The argument is: $ARGUMENTS
   - Parse it as `<topic> [number]`. The topic is everything except an optional trailing number. If a number is provided, use it as the question count. Otherwise default to 10-14.
   - Examples: `terraform` → topic "terraform", 10-14 questions. `terraform 5` → topic "terraform", 5 questions. `all tech docs 20` → topic "all tech docs", 20 questions.
2. Search the `docs/` directory for markdown files related to the topic (check filenames and content).
3. Read the matching notes file(s) to get a sense of the topic scope and what the user has been learning — treat these as a vibe check, not as the source of truth for quiz content.
4. Using **your own knowledge** as the primary source, generate the quiz questions on the topic. The notes tell you *what* to quiz on and at roughly what level, but the questions themselves should draw from your deep understanding of the subject — not parrot back sparse notes. Ask questions that would genuinely test whether someone understands the topic, including concepts the notes may not even mention.
5. Use a **mix of question types**:
   - **Single correct answer** (radio buttons): 4 options, one marked `[x]`. Use for questions with one clear correct answer.
   - **Multiple correct answers** (checkboxes): 4-5 options, two or more marked `[x]`. Use for "select all that apply" style questions. Include at least 2-3 of these.
   - **Fill in the blank** (text input): Use [[answer]] inline in the question text. Use for key terms, command names, or short factual answers. Include at least 2-3 of these.
6. Question quality guidelines:
   - Test real understanding, not trivia
   - Include tricky but fair distractors — wrong answers should be plausible
   - Cover a range of difficulty: some fundamentals, some intermediate, a couple that make you think
   - Include a brief explanation separated by a `---` horizontal rule after the answer options/question. This content is hidden until the user submits their answer
7. Write the quiz to `docs/quizzes/<topic>.md` (using the parsed topic name, without the trailing number) using the format below. Create the `docs/quizzes/` directory if it doesn't exist.

## Quiz file format

The file should start with a heading and then contain `<quiz>` blocks. Here are examples of each question type:

### Single correct answer (radio buttons)

When there is exactly one `[x]`, radio buttons are displayed:

```markdown
<quiz>
What does `terraform init` do?

- [ ] Creates cloud resources
- [x] Initializes the workspace and installs providers
- [ ] Validates configuration files
- [ ] Destroys all managed resources

---

`terraform init` sets up the working directory and downloads required provider plugins.
</quiz>
```

### Multiple correct answers (checkboxes)

When there are multiple `[x]` marks, checkboxes are displayed. The user must select all correct answers and only correct answers to succeed:

```markdown
<quiz>
Which of the following are valid Terraform block types? (Select all that apply)

- [x] resource
- [x] data
- [ ] service
- [x] module
- [ ] endpoint

---

`resource`, `data`, and `module` are valid Terraform block types. `service` and `endpoint` are not.
</quiz>
```

### Fill in the blank (text input)

Use double square brackets [[answer]] for fill-in-the-blank. Answers are case-insensitive:

```markdown
<quiz>
The Terraform command to format your configuration files is terraform [[fmt]].

---

`terraform fmt` auto-formats `.tf` files to a canonical style.
</quiz>
```

Each question must be wrapped in `<quiz>` and `</quiz>` tags.
