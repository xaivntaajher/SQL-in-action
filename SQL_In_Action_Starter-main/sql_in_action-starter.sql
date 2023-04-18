-- <<<<<<<<<<<<<<<<<<<<<<< EXAMPLE >>>>>>>>>>>>>>>>>>>>>>>>
-- TODO: Remove the "--" from the below SELECT query and run the query
--    NOTE: When writing queries, make sure each one ends with a semi-colon

-- SELECT * FROM final_airbnb;
select * from intro_sql.final_airbnb;


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 1 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out how many rows are in the table "final_airbnb"
-- EXPECTED OUTPUT: 146
select count(*) from intro_sql.final_airbnb;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 2 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out the name of the host for "host_id" 63613
-- HINT: "Where" could it be?
select host_name from intro_sql.final_airbnb
where host_id = 63613;
-- EXPECTED OUTPUT: Patricia

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 3 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to just show the unique neighbourhoods listed
-- HINT: This is a "distinct" operation...
select distinct neighbourhood from intro_sql.final_airbnb;
-- EXPECTED OUTPUT: 40 neighbourhoods listed


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 4 >>>>>>>>>>>>>>>>>>>>>>>

-- Find both the highest price listing and the lowest price listing, displaying the entire row for each
-- HINT: This can be two different queries.

-- FOOD FOR THOUGHT: Think about the results. Are the high and low prices outliers in this data set?
select min(price), max(price) from intro_sql.final_airbnb;
-- EXPECTED OUTPUT: Highest = 785, Lowest = 55


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 5 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the average availability for all listings in the data set (using the availability_365 column)
-- HINT: Aggregates are more than just big rocks...
select avg(availability_365) from intro_sql.final_airbnb;
-- EXPECTED OUTPUT: 165.3904


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 6 >>>>>>>>>>>>>>>>>>>>>>>
-- Find all listings that do NOT have a review
-- HINT: There are a few ways to go about this. Remember that an empty cell is "no value", but not necessarily NULL
select * from intro_sql.final_airbnb
where number_of_reviews = 0;
-- EXPECTED OUTPUT: 6 rows


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 7 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the id of the listing with a room_type of "Private room" that has the most reviews 
-- HINT: Sorting is your friend!
select id, room_type, number_of_reviews from intro_sql.final_airbnb
where room_type = "Private room"
order by number_of_reviews desc
limit 1;
-- EXPECTED OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 8 >>>>>>>>>>>>>>>>>>>>>>>
-- Find the most popular neighbourhood for listings 
-- HINT: Look for which neighbourhood appears most frequently in the neighbourhood column
-- HINT: You are creating "summary rows" for each neighbourhood, so you will just see one entry for each neighbourhood
select neighbourhood from intro_sql.final_airbnb
group by neighbourhood 
order by count(*) desc
limit 1;
-- EXPECTED OUTPUT: Williamsburg
-- INVESTIGATE: Should Williamsburg be crowned the most popular neighbourhood? No, Williamsburg is tied with Harlem with 16
select neighbourhood, count(*) as Neighbourhood_count from intro_sql.final_airbnb
group by neighbourhood
order by count(neighbourhood) desc;

-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 9 >>>>>>>>>>>>>>>>>>>>>>>
-- Query the data to discover which listing is the most popular using the reviews_per_month for all listings with a minimum_nights value of less than 7
-- HINT: Sorting is still your friend! So are constraints.
select * from intro_sql.final_airbnb
where reviews_per_month < 7
order by reviews_per_month desc
limit 1;
-- EXPECTED OUTPUT: 58059


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 10 >>>>>>>>>>>>>>>>>>>>>>>
-- Find out which host has the most listings. 
-- Create a NEW column that will show a calculation for how many listings the host for each listing has in the table
-- Display the column using aliasing.
-- HINT: Work this one step at a time. See if you can find a way to just display the count of listings per host first.
select host_name, count(*) as calculated_number_of_listing from intro_sql.final_airbnb
group by host_name
order by count(host_name) desc
limit 1;
-- EXPECTED OUTPUT: The Box House Hotel with 6 listings


-- <<<<<<<<<<<<<<<<<<<<<< PROBLEM 11 >>>>>>>>>>>>>>>>>>>>>>>
-- <<<<<<<<<<<<<<<<<<<<<<< WRAP UP >>>>>>>>>>>>>>>>>>>>>>>>>
-- What do you think makes a successful AirBnB rental in this market? What factors seem to be at play the most?
-- Write a few sentences and include them with your project submission in the README file 
select * from intro_sql.final_airbnb
order by number_of_reviews desc;

-- <<<<<<<<<<<<<<<<<<<<< ** BONUS ** >>>>>>>>>>>>>>>>>>>>>>>
-- Find the the percent above or below each listing is compared to the average price for all listings. avg price 165.1027
-- HINT: No hints! It's a bonus for a reason :)
select avg(price) from intro_sql.final_airbnb;
select price, (price / 165.1027) * 100 as percent_difference from intro_sql.final_airbnb
group by price
order by price desc;

