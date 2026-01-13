#!/usr/bin/perl
use strict;
use warnings;

# --------------------------------------------------------
# Log Analyzer Program
# - Reads log files
# - Counts occurrences of specific keywords (e.g., ERROR, WARNING, CRITICAL)
# - Helps in monitoring and debugging logs efficiently
# --------------------------------------------------------

print("\t\t\t\t\t\t\"Welcome to Log Analyzer\"\n\n");

# File paths
my $keyword_file = 'D:\\Perl\\test\\keywords.txt';  # File where keywords are stored
my $log_file     = 'D:\\Perl\\test\\sample.log';    # Log file to analyze

# Show main menu and get option
my $option = &selection();
while($option > 4 || $option < 1) {
    # Keep asking until a valid option is entered
    $option = &selection();
}

# --------------------------------------------------------
# Main menu actions
# --------------------------------------------------------
if ($option == 1) {
    analyze_logs();   # Option 1 → Analyze the log file
}
elsif ($option == 2) {
    # Option 2 → Add a new keyword
    print("Enter the NEW keyword to track: \n");
    chomp(my $new_keyword = <STDIN>);
    $new_keyword = uc($new_keyword);  # Convert to uppercase for consistency

    open(my $fh, ">>", $keyword_file) or die "Couldn't open $keyword_file";
    print $fh "$new_keyword\n";  # Append keyword to file
    close($fh);

    print("Keyword '$new_keyword' added successfully!\n\n");
}
elsif ($option == 3) {
    # Option 3 → Show all keywords
    open(my $fh, "<", $keyword_file) or die "Couldn't open $keyword_file";
    print("Tracking Keywords:\n\n");
    while (my $row = <$fh>) {
        chomp($row);
        print("$row\n");
    }
    close($fh);
    print("\n");
}
else {
    # Option 4 → Exit program
    print("You have successfully exited the program.\n");
}

# --------------------------------------------------------
# Subroutine: selection
# - Displays the main menu
# - Returns user’s choice (1–4)
# --------------------------------------------------------
sub selection {
    print("Select an option : \n\n");
    print("1. Analyze Logs\n");
    print("2. Add New Keyword\n");
    print("3. View Keywords\n");
    print("4. Exit\n\n");
    print("Enter the selection : ");
    chomp(my $sel_option = <STDIN>);
    print("\n");

    if ($sel_option <= 4 && $sel_option > 0) {
        return $sel_option;   # Return valid option
    } else {
        print("You have entered wrong option \n\n");
        return 5;             # Return invalid marker so loop asks again
    }
}

# --------------------------------------------------------
# Subroutine: analyze_logs
# - Reads keywords from file
# - Scans the log file line by line
# - Counts how many times each keyword appears
# - Prints the results
# --------------------------------------------------------
sub analyze_logs {
    # Step 1: Load keywords
    open(my $kf, "<", $keyword_file) or die "Couldn't open $keyword_file";
    my @keywords;
    while (my $row = <$kf>) {
        chomp($row);
        push @keywords, uc($row);  # Store keywords in uppercase
    }
    close($kf);

    # Step 2: Initialize counts for each keyword
    my %count;
    foreach my $kw (@keywords) {
        $count{$kw} = 0;
    }

    # Step 3: Read log file and count keyword occurrences
    open(my $lf, "<", $log_file) or die "Couldn't open $log_file";
    while (my $line = <$lf>) {
        foreach my $kw (@keywords) {
            # \b → word boundary, i → case-insensitive match
            if ($line =~ /\b$kw\b/i) {
                $count{$kw}++;
            }
        }
    }
    close($lf);

    # Step 4: Print the results
    print("Log Analysis Results:\n\n");
    foreach my $kw (@keywords) {
        print("$kw => $count{$kw}\n");
    }
    print("\n");
}
