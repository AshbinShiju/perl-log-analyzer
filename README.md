# 📊 Perl Log Analyzer

A lightweight, automated utility for parsing server logs and tracking critical events. This tool allows engineers to define custom keywords (e.g., `ERROR`, `WARNING`, `CRITICAL`) and quantify their occurrences across large log files, streamlining the debugging and monitoring process.

---

## 🚀 Key Features
* **Automated Parsing:** Scans log files line-by-line using efficient regex pattern matching.
* **Dynamic Configuration:** Users can add new tracking keywords on the fly without modifying the source code.
* **Case-Insensitive Matching:** Robust detection handles variations like `Error`, `error`, and `ERROR`.
* **CLI Interface:** Simple, interactive command-line menu for ease of use.

---

## 🛠️ Prerequisites
* **Perl 5.x** or higher installed on your machine.
  * *Windows:* [Strawberry Perl](https://strawberryperl.com/)
  * *Linux/Mac:* Pre-installed on most distributions.

---

## ⚙️ Installation & Setup

1.  **Clone the Repository**
    ```bash
    git clone [https://github.com/AshbinShiju/perl-log-analyzer.git](https://github.com/AshbinShiju/perl-log-analyzer.git)
    cd perl-log-analyzer
    ```

2.  **Configure File Paths**
    ⚠️ **Important:** Before running the script, you must update the file paths to match your local directory structure.

    Open `Log analyser.pl` in your text editor and update **lines 15 and 16**:

    ```perl
    # CHANGE THESE PATHS to match your local folder
    my $keyword_file = 'C:\\YourPath\\perl-log-analyzer\\keywords.txt';
    my $log_file     = 'C:\\YourPath\\perl-log-analyzer\\sample.log';
    ```

---

## 💻 Usage

Run the script from your terminal:

```bash
perl "Log analyser.pl"
