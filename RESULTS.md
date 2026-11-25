# UI lab results

Tool parts that I chose: Part 2, Selenium WebDriver in Java; Part 3, Robot Framework.

## Part 0

The user manually inspected the Selenium text-input locator and supplied QuickPizza screenshots showing the heading, advanced fields, 600-calorie limit, Knife excluded, vegetarian checked, a Pizza cutter recommendation with 350 calories, and the login-required message. That attempt used `Lab Pizza 9/25/2026`, without a time, and its admin lookup was not supplied. At the user's request, the assistant completed a fresh seven-step browser verification with a date-and-time name and checked the locators using Selenium WebDriver. The final run below is **assistant-assisted verification**, not a claim that the student performed an unassisted manual run or typed every Console command. [Earlier observations](evidence/manual-attempts.md) are preserved separately.

- Step 0.1, Chrome version: **158.0.8127.88**, Windows 11 x64.
- Step 0.3, ChromeDriver version: **158.0.8127.88**, matching Chrome, downloaded from Google's official Chrome for Testing distribution and stored outside the repository.
- Step 0.4, Pizza, Please!: `button[name="pizza-please"]`, **1 match**.
- Step 0.4, Excluded tools: `select`, **1 match**.
- Step 0.4, Must be vegetarian: `input#default-checkbox`, **1 match**.
- Step 0.4, Custom Pizza Name: `input#pizza-name`, **1 match** before and after the recommendation.
- Step 0.4, Selenium Text input: `#my-text-id`, **1 match**; the element has `name="my-text"`. The user's Console screenshot also verifies this selector.
- Step 0.4, Selenium checkboxes: `input[type=checkbox]`, **2 matches**.
- Step 0.4, Selenium Submit: `//button[normalize-space()='Submit']`, **1 match**.
- Step 0.4, QuickPizza `#floating_filled`: **3 matches**. The label XPath `//label[normalize-space()='Max Calories per Slice']/preceding-sibling::input` has **1 match**.
- Step 0.4, after a recommendation `#pizza-name` has **2 matches**, while `input#pizza-name` still has **1**. This confirms why the input tag is necessary.
- Step 0.5, final assisted run: **Lab Pizza 20261125-184023**, tool **Scissors**, **375 calories per slice**.
- Run started: **2026-11-25T18:40:23.077103+07:00** (Asia/Bangkok); elapsed **20.358 s**; **7 steps passed**. The locator results were obtained by executing DOM queries in the real browser through WebDriver. They are not screenshots of a manually operated DevTools Console.

Test case ID: **QP-01**. Title: **A custom pizza reaches the admin list**.

Objective: Check that the recommendation keeps the entered restrictions, rating requires a login, and the admin list contains the same pizza and tool.

Preconditions: QuickPizza is reachable and a fresh browser starts without a customer login. Test data: maximum calories 600; exclude Knife; vegetarian checked; a name beginning `Lab Pizza` followed by the current date and time; public demo admin credentials `admin` / `admin`.

| Step | Action and expected result | Actual result | Pass or fail |
|---|---|---|---|
| 1 | Open the home page; the expected heading appears. | Looking to break out of your pizza routine? | PASS |
| 2 | Turn on Advanced; all four required fields appear. | All four advanced fields are visible; initial calories value is 1000 | PASS |
| 3 | Enter 600, exclude Knife, check vegetarian and enter the date-and-time name; fields retain these values. | 600; Knife excluded; vegetarian checked; name Lab Pizza 20261125-184023 | PASS |
| 4 | Request a pizza; its name matches, its tool is not Knife, and calories per slice are at most 600. | Name Lab Pizza 20261125-184023; tool Scissors; calories per slice 375 | PASS |
| 5 | Click Love it! without logging in; Please log in first. appears. | Please log in first. | PASS |
| 6 | Open /admin and sign in; Latest pizza recommendations appears. | Signed in with public demo admin credentials; Latest pizza recommendations appeared. | PASS |
| 7 | Find the exact pizza name in the admin list; its tool matches the recommendation. | Lab Pizza 20261125-184023 (tool=Scissors, ingredients_number=5) | PASS |

Evidence: [request fields](evidence/assisted-qp01/step-3.png), [recommendation](evidence/assisted-qp01/step-4.png), [login-required message](evidence/assisted-qp01/step-5.png), [matching admin record](evidence/assisted-qp01/step-7.png), [Selenium web form](evidence/assisted-qp01/web-form.png), and [machine-readable locator and step results](evidence/assisted-qp01/verification.json).

## Part 2: Selenium WebDriver in Java

- Java environment: Oracle JDK 25 with `javac`; Maven 3.9.14; Selenium 4.52.0; JUnit 6.1.3. All eight source files compiled with Java release 21. All runs below used headless Chrome on Windows on 25 November 2026 (Asia/Bangkok).
- Step 2.4, the failure line for the wrong title: `FirstTest.webFormOpens:23 expected: <Web Form> but was: <Web form>`. This was observed in a real run. Restoring `Web form` produced 1 test passed, 0 failures.
- Step 2.9, deliberate wrong confirmation: `WebFormTest.fillAndSubmitTheForm:56 expected: <Received> but was: <Received!>`. The exclamation mark was restored and the test passed.
- Step 2.10, deliberate missing wait: `NoSuchElementException: no such element: Unable to locate element: {"method":"css selector","selector":"#box0"}`. Restoring `WebDriverWait` made `WaitTest` pass. The restored form and wait tests passed together: 2 tests, 0 failures, 0 errors.
- Step 2.15, QP01Test run 1: **PASS**, 1 test, 0 failures/errors; Maven total time **14.115 s**, test elapsed **10.43 s**.
- Step 2.15, QP01Test run 2: **PASS**, 1 test, 0 failures/errors; Maven total time **14.821 s**, test elapsed **11.01 s**.
- Step 2.20, full run 1: **BUILD SUCCESS**, **5 tests**, 0 failures/errors/skipped; Maven total time **38.181 s**. Page-object pizza: **Lab Pizza 20261125-005825**.
- Step 2.20, full run 2: **BUILD SUCCESS**, **5 tests**, 0 failures/errors/skipped; Maven total time **38.840 s**. Page-object pizza: **Lab Pizza 20261125-005906**.
- Evidence: four screenshots per full run in [run 1](selenium-java/screenshots/20261125-005825/) and [run 2](selenium-java/screenshots/20261125-005906/). The [page-object report](selenium-java/reports/uilab.QP01PageObjectTest.txt) is copied from the second passing run. The `reports/` folder also contains the console logs of both QP01Test runs and both full runs.
- Selenium logged a CDP-version warning because the PDF pins Selenium 4.52.0 and the installed Chrome is version 158. These tests use standard WebDriver operations; all five executed and passed in both full runs.

## Part 3: Robot Framework

- `robot --version`: Robot Framework 7.5.1 (Python 3.13.5 on win32); SeleniumLibrary 6.9.0; Python Selenium 4.54.0. All runs used headless Chrome 158.0.8127.88 with the matching ChromeDriver.
- Step 3.2, failure message for the wrong title: `Title should have been 'Web Form' but was 'Web form'.` The deliberate failure produced 1 test, 0 passed, 1 failed. Restoring `Web form` produced 1 test, 1 passed, 0 failed.
- The first test and the web-form test were also executed together: **2 tests, 2 passed, 0 failed**. These were live browser runs.
- Step 3.8, run 1: **PASS**, 1 test, 1 passed, 0 failed; suite elapsed **16.748 s**; pizza **Lab Pizza 20261125-005346**, tool **Scissors**, calories per slice **475**.
- Step 3.8, run 2: **PASS**, 1 test, 1 passed, 0 failed; suite elapsed **16.342 s**; pizza **Lab Pizza 20261125-005943**, tool **Pizza cutter**, calories per slice **575**.
- Evidence: [run 1 report](robot/results/run1/report.html), [run 1 log](robot/results/run1/log.html), [run 2 report](robot/results/run2/report.html), [run 2 log](robot/results/run2/log.html). Each folder has `output.xml` and four screenshots, covering steps 3, 4, 5 and 7. The screenshot for step 5 shows `Please log in first.`, and step 7 shows the same pizza and tool in the admin list.

## Part B

1. The recorded QuickPizza inspection found three elements with the id `floating_filled`, so that id could not identify the calories box alone. The label-based XPath selects the input beside `Max Calories per Slice`. Giving that input a unique id such as `max-calories-per-slice` and matching the label's `for` attribute would allow a short, unique id locator. That would make the test easier to read and maintain.

2. This is a consistency test oracle because it compares the recommendation with the admin record from the same scenario. If the recommendation showed Scissors but the stored record showed Knife, the comparison would detect the disagreement. In Robot run 1, the recommendation showed Scissors and the admin screenshot showed `Lab Pizza 20261125-005346 (tool=Scissors, ingredients_number=6)`, so the comparison passed. The final assisted run independently matched `Lab Pizza 20261125-184023 (tool=Scissors, ingredients_number=5)` to the recommendation's Scissors tool.

3. Read the ingredients shown in the recommendation and check that every ingredient is vegetarian. For example, Robot run 1 showed mozzarella, spinach and asparagus among its ingredients. The page does not classify each displayed ingredient as vegetarian or non-vegetarian, so the test would need an approved ingredient catalogue or a maintained classification list. Checking only the vegetarian checkbox would not establish that the returned pizza satisfies the restriction.

4. Java used `WebDriverWait` with conditions for headings, options, recommendation text and the admin list; Robot used element-visibility and text-based waits in named resource keywords. The original writing times were not measured, so these results cannot support a claim that either version was faster to write. Both Java full runs passed five tests in 38.181 s and 38.840 s, while the single-scenario Robot runs took 16.748 s and 16.342 s; the different test counts mean those totals are not a direct speed comparison. Java's Surefire text report is compact, while Robot's HTML log makes each named step and screenshot easy to inspect. Robot run 1's step-5 screenshot clearly includes the login-required message below the rating buttons.

5. I would choose Robot Framework for Project 2 because its named keywords map clearly to the seven written QP-01 steps. Its HTML log places screenshots beside the actions that produced them, which helped verify the login message and the admin record in both passing runs. The shared `quickpizza.resource` file also keeps page locators and actions together, so a locator repair does not spread through the test case.

6. In `QP01Test`, a changed calories-box locator would require editing the XPath in the test method. In the page-object version, I would update the `MAX_CALORIES` constant in `HomePage`. `QP01PageObjectTest` would keep calling `showAdvanced`, `setMaxCalories` and `maxCalories` without changing its locators. The repair is smaller because those page actions share the same constant.

7. In Robot Framework, I would change `${MAX CALORIES}` in `robot/resources/quickpizza.resource`. Both `Turn On Advanced` and `Fill In The Pizza Request` use that variable instead of repeating its XPath. The scenario in `pizza_scenario.robot` calls the named keywords and does not contain the calories locator. This keeps the page repair out of the test case file.

## Submission

- Public repository: [Tanyarat2/ui-lab](https://github.com/Tanyarat2/ui-lab).
- The Java and Robot repeat-run evidence is included, along with the final assisted browser verification and the preserved earlier manual observations.
- Submit the repository URL on MyCourses before the deadline shown there. MyCourses submission has not been performed by the assistant because no connected session is available.
