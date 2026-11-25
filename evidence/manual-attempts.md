# Earlier manual observations

These are preserved observations from before the final assisted verification. The current completed browser checks are in RESULTS.md.


**Manual-run provenance:** The QP-01 table below preserves the manual observations already present in this project when this session began. It was not rerun by hand in this session. The new automated runs below passed all seven steps, including the admin lookup that failed in this earlier manual run.


- Step 0.1, Chrome version: Google Chrome 158.0.8127.88 on Windows 11 x64. Verified from the installed executable and the successful WebDriver sessions on 25 November 2026 (Asia/Bangkok).
- Step 0.3, ChromeDriver version: ChromeDriver 158.0.8127.88. Downloaded from Google's official Chrome for Testing distribution into the Windows temporary directory, outside this repository. The version command and live browser launches succeeded.
- Step 0.4, locator of Pizza, Please!: `button[name="pizza-please"]` — one match on the live page.
- Step 0.4, locator of Excluded tools: `select` — one match on the live page.
- Step 0.4, locator of Must be vegetarian: `input#default-checkbox` — one match on the live page.
- Step 0.4, locator of Custom Pizza Name: `input#pizza-name` — one match on the live page.
- Step 0.4, Selenium web-form text input: the user's Console screenshot shows `document.querySelector("#my-text-id")` returning the Text input element with `id="my-text-id"` and `name="my-text"`. **PASS.** The checkbox count and Submit XPath result have not yet been supplied.
- Step 0.4, the live page contained three matches for `#floating_filled`. Use `//label[normalize-space()='Max Calories per Slice']/preceding-sibling::input` for the calories box. The original automated Java and Robot web-form tests passed. The user's manual Console check above verifies the text-input selector; the remaining manual locator checks are pending.
- Step 0.5, earlier recorded manual run: **Lab Pizza 20261125-001400**, **Scissors**, **400 calories per slice**. Latest user-supplied attempt: **Lab Pizza 9/25/2026**, **Pizza cutter**, **350 calories per slice**; see its status below.

Test case ID: **QP-01**. Title: **A custom pizza reaches the admin list**.

Objective: Check that a pizza request with restrictions gives a pizza that keeps them, that rating a pizza needs a login, and that the admin sees the new pizza.

Preconditions: QuickPizza is reachable at `https://quickpizza.grafana.com`, and the browser is not logged in as a customer.

Test data: a timestamped Lab Pizza name, maximum calories per slice 600, excluded tool Knife, vegetarian selected, admin user `admin` with public demo password `admin`.

| Step | Action and input | Expected result | Actual result | Pass or fail |
|------|------------------|-----------------|---------------|--------------|
| 1 | Open the QuickPizza home page. | The heading reads Looking to break out of your pizza routine? | The exact heading appeared. | PASS |
| 2 | Turn on Advanced. | Max Calories per Slice, Excluded tools, Must be vegetarian and Custom Pizza Name appear. | All four fields appeared. Calories initially showed 1000. | PASS |
| 3 | Enter 600, exclude Knife, select vegetarian and enter Lab Pizza 20261125-001400. | The fields show these values. | The browser showed 600, Knife selected, vegetarian checked and the exact pizza name. | PASS |
| 4 | Click Pizza, Please! | The answer shows the name, a tool other than Knife and no more than 600 calories per slice. | Name: Lab Pizza 20261125-001400; Tool: Scissors; Calories per slice: 400. | PASS |
| 5 | Click Love it! without logging in. | The page says Please log in first. | Please log in first. appeared. | PASS |
| 6 | Open /admin and sign in using the prefilled demo credentials. | The page shows Latest pizza recommendations. | Latest pizza recommendations appeared after sign-in. | PASS |
| 7 | Find the same pizza name in the admin list. | Its line shows the pizza name and Scissors. | The displayed list contained 15 other recommendations and did not contain Lab Pizza 20261125-001400. The tool comparison could not be made. The cause was not established. | FAIL |

### Subsequent manual attempt supplied by the user

The user supplied two QuickPizza screenshots in the conversation. They show a manual attempt with pizza name **pp**, tool **Scissors**, and **525 calories per slice**. This attempt does not yet complete QP-01 because the form shows a maximum of **1000**, the name does not follow `Lab Pizza <date-time>`, and exclusion of Knife is not visibly confirmed. These are differences in the entered test data, not evidence of an application defect.

| Step | Screenshot observation | Status |
|---|---|---|
| 1 | The exact home-page heading is visible. | PASS |
| 2 | Advanced is on and all four required fields are visible. | PASS |
| 3 | Maximum calories shows 1000; name is pp; vegetarian is checked. Knife is listed but its selection is not visibly confirmed. | Required inputs not completed |
| 4 | Recommendation shows Name: pp, Dough: Thin, Tool: Scissors, Calories per slice: 525. The result keeps the entered name, uses a tool other than Knife, and is within 600 calories, but the required 600-calorie request and timestamped name were not used. | Observed output checks pass; required QP-01 scenario remains incomplete |
| 5 | Please log in first. is visible below the rating buttons. | PASS |
| 6 | No admin sign-in result supplied for this attempt. | Pending |
| 7 | No matching admin record supplied for this attempt. | Pending |

For the completed manual run, use a new name beginning `Lab Pizza` followed by the current date and time, replace 1000 with 600, explicitly select Knife, keep vegetarian checked, and generate the recommendation again. Then verify the login-required message and the same name and tool in the admin list. Record the new run separately from this incomplete attempt.

### Latest manual attempt supplied by the user

The next two screenshots show the corrected restrictions: maximum calories **600**, **Knife selected** in Excluded tools, and **Must be vegetarian checked**. The literal name is **Lab Pizza 9/25/2026**. The recommendation uses **Pizza cutter** and contains **350 calories per slice**, and the login-required message is visible. The name includes a date but no time, so it still differs from the lab's date-and-time naming requirement. Admin sign-in and the matching admin record have not yet been supplied for this attempt.

| Step | Screenshot observation | Status |
|---|---|---|
| 1 | The exact home-page heading is visible. | PASS |
| 2 | Advanced is on and all four required fields are visible. | PASS |
| 3 | Maximum calories is 600, Knife is selected, vegetarian is checked, and the name is Lab Pizza 9/25/2026. | Restrictions PASS; date-and-time name incomplete |
| 4 | The recommendation preserves the name and shows Tool: Pizza cutter and Calories per slice: 350. Pizza cutter is not Knife and 350 is no greater than 600. | PASS for the entered name, tool and calorie checks |
| 5 | Please log in first. is visible below the rating buttons. | PASS |
| 6 | No admin sign-in result supplied for this attempt. | Pending |
| 7 | No admin record supplied matching Lab Pizza 9/25/2026 and Pizza cutter. | Pending |

To finish a run with all required test data, use `Lab Pizza` followed by the actual current date and time, generate a new recommendation with the same restrictions, check the login-required message, and verify that exact new name and tool in the admin list. Do not combine the earlier attempt's recommendation or login message with the new pizza's admin record.

