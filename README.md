# UI lab

Chosen tools: **Part 2 — Selenium WebDriver with Java** and **Part 3 — Robot Framework**.

This project contains the required source files, Part 0 observations, Part B answers and browser-test evidence. See [RESULTS.md](RESULTS.md) for the actual run results and the remaining submission steps.

## Before running

Use Google Chrome, JDK 21 or newer, Maven 3.9 or newer and Python 3.10 or newer. Download the ChromeDriver that matches your Chrome version, keep it outside this repository and set `CHROMEDRIVER` to its full path, as in Part 0 of the lab.

On this Windows computer, the matching ChromeDriver was downloaded outside the repository. For the current installation, run this in each new PowerShell terminal:

```powershell
$env:CHROMEDRIVER = Join-Path $env:TEMP "ui-lab-driver-158.0.8127.88\chromedriver-win64\chromedriver.exe"
```

If the temporary folder has been cleared or Chrome has updated, download the matching driver again and set `CHROMEDRIVER` to its new location. The lab's suggested permanent location is `C:\drivers\chromedriver-win64\chromedriver.exe`.

## selenium-java

This folder contains the first test, the web-form test, the dynamic wait test, QP-01 and QP-01 with page objects. From this folder, run all five tests with:

```text
mvn test "-Dheadless=true"
```

The page-object test saves screenshots in `screenshots/<timestamp>/`. The two required full runs are recorded in `RESULTS.md`; `reports/` holds their console logs and the page-object Surefire text report from the second run. This session used `"-Dmaven.repo.local=../.m2-lab"` to keep downloaded dependencies in a local, ignored cache; add that option to reuse it on this computer.

For the two QP01Test runs in Step 2.15, use:

```text
mvn test "-Dtest=QP01Test" "-Dheadless=true"
```

## robot

This folder contains the first test, the web-form test, QP-01 and the shared QuickPizza keywords and locators. From the repository root, prepare the Python environment once:

```text
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r robot\requirements.txt
```

Then, from `robot/`, run all three tests with:

```powershell
..\.venv\Scripts\python.exe -m robot -v BROWSER:headlesschrome first.robot web_form.robot pizza_scenario.robot
```

Collect the two required QP-01 runs separately:

```text
..\.venv\Scripts\python.exe -m robot -d results/run1 -v BROWSER:headlesschrome pizza_scenario.robot
..\.venv\Scripts\python.exe -m robot -d results/run2 -v BROWSER:headlesschrome pizza_scenario.robot
```

Each output folder contains its report, log, XML output and four screenshots. Open `results/run1/report.html` or `results/run2/report.html` in a browser; the log links each screenshot to the step that captured it.

## Required screenshots

The PDF requires evidence after QP-01 steps 3, 4, 5 and 7. These are generated automatically; you do not need to take terminal screenshots.

| Step | Evidence | Java file | Robot file in each run folder |
|---|---|---|---|
| 3 | 600 calories, Knife excluded, vegetarian checked, timestamped name | `step-3.png` | `qp01-step3-fields.png` |
| 4 | Recommendation name, tool and calories | `step-4.png` | `qp01-step4-pizza.png` |
| 5 | Please log in first. | `step-5.png` | `qp01-step5-login-needed.png` |
| 7 | Admin list with the same pizza and tool | `step-7.png` | `qp01-step7-admin-list.png` |

## Part 0 verification

The user supplied manual Console and QuickPizza screenshots. At the user's request, the remaining checks were completed in a fresh assistant-assisted Selenium browser run. All seven QP-01 steps and all locator checks passed; the method and exact observations are recorded in [RESULTS.md](RESULTS.md). This is identified as assistance rather than an unassisted student manual run.

The `evidence/assisted-qp01/` folder holds the final request, recommendation, login-required message, matching admin record, web-form screenshot and JSON verification results. `evidence/manual-attempts.md` preserves the earlier observations without mixing pizza names from different runs.

## Submission

Repository: [Tanyarat2/ui-lab](https://github.com/Tanyarat2/ui-lab).

This repository includes both tools' source files, Java screenshots and reports, both Robot result folders, Part 0 observations, and seven Part B answers. The local `ui-lab-submission.zip` contains the same submission files. Downloaded dependencies, build output, temporary scripts and the ZIP are excluded from Git by `.gitignore`.

Submit the repository URL on MyCourses before its deadline. MyCourses submission has not been performed by the assistant; no connected MyCourses browser session is available.
