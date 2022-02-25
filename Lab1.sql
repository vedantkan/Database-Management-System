USE vbk10;

DROP TABLE IF EXISTS accounts;
CREATE TABLE IF NOT EXISTS accounts(
	account_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    balance DOUBLE NOT NULL,
    type VARCHAR(30) NOT NULL,
    date_opened DATETIME,
    status VARCHAR(30)
)Engine=InnoDB;

DROP TABLE IF EXISTS transactions;
CREATE TABLE IF NOT EXISTS transactions(
	transaction_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    amount DOUBLE NOT NULL,
    remaining_balance DOUBLE NOT NULL,
    account_id INT NOT NULL
)Engine=InnoDB;

ALTER TABLE transactions
	ADD CONSTRAINT 
    FOREIGN KEY(account_id)
    REFERENCES accounts(account_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
INSERT INTO accounts
(balance, type, date_opened, status)
VALUES
(10000,'SAVINGS', '2021-08-27 11:00:00','OPEN'),
(100000,'CHECKING', '2021-09-25 11:30:00','CLOSE'),
(1000000,'BUSINESS', '2021-10-18 12:15:00','OPEN');

INSERT INTO transactions
(date_time, amount, remaining_balance, account_id)
VALUES
('2021-12-31 10:00:00', 1000, 9000, 1),  
('2021-11-15 15:30:00', 10000, 90000, 2), 
('2021-12-16 14:00:00', 100000, 900000, 3), 
('2022-01-05 09:45:00', 300000, 600000, 3), 
('2022-01-25 16:15:00', 100000, 500000, 3); 

SELECT * FROM accounts;
SELECT * FROM transactions;