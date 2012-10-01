1. Goals and Intentions
The goals for this program is to mirror the functionality of the UNIX cal (http://en.wikipedia.org/wiki/Cal_(Unix)) program. It is built from scratch using Ruby 1.9.3.

2. Features
NSS-Cal currently only supports printing out a single month-- so, given a command line input of a month (as indicated by a number) and a year, NSS-Cal will print the month name and the year, followed by a properly formatted Gregorian Calendar.

3. Limitations
	a. Currently only supports a single month input-- cannot yet print a whole year
	b. Valid only for years between 1800 - 3000 AD. Does not accurately represent the Gregorian Reformation and adoption in September, 1752. See: http://en.wikipedia.org/wiki/Gregorian_calendar

4. How to Use NSS-Cal
NSS-Cal uses the ruby compiler from the command line. Execute the code by typing: ruby cal.rb (month number) (year)
User must replace month number and year with valid numbers for the program to execute properly.

5. Dependencies
NSS-Cal requires the use of Ruby 1.9.3 (N.B. has not been yet tested on 1.8.*). The program logic is highly dependent on the Zeller's Congruence (http://en.wikipedia.org/wiki/Zeller%27s_Congruence).

6. File Structure
The lib directory contains the cal.rb file and related required files. Zeller's Congruence has its own file as do many other smaller parts of the program (Month names, etc). All test files are in the test directory.

7. Author Info
As previously stated the calendar math is based off of Zeller's Congruence (http://en.wikipedia.org/wiki/Zeller%27s_Congruence). The inspiration for this basic project is from the UNIX Cal program (http://en.wikipedia.org/wiki/Cal_(Unix)).
That being said, the program's author is Max Beizer-- @maxbeizer. Serious programmatic and general life guidance given by Eliza Brock and Jeremy Holland (but please don't troll them for my shortcomings).

8. Contributions
Feel free to open tickets or send pull requests with improvements. Thanks in advance for your help!

9. To Do 
	a. Flesh out year functionality
	b. test on pre 1.9 ruby versions

10. Changelog
Coming soon.
