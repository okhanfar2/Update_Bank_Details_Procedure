CREATE OR REPLACE PROCEDURE proc_bank(
    p_account_no NUMBER,
    p_new_data VARCHAR2,
    p_activity VARCHAR2
) AS
    v_length VARCHAR2(100);
    v_count NUMBER;
    p_message VARCHAR2(100);
BEGIN
    -- Check if the account exists
    SELECT COUNT(1) INTO v_count FROM bank_details WHERE account_no = p_account_no;

    IF v_count <> 0 THEN
        IF p_activity = 'ADDRESS' THEN
            -- Check address length
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length <= 30 THEN
                -- Update address
                UPDATE bank_details SET address = p_new_data WHERE account_no = p_account_no;
                p_message := 'Your address updated successfully!';
                dbms_output.put_line(p_message);
            ELSE
                p_message := 'Address length should be 30 characters or less!';
                dbms_output.put_line(p_message);
            END IF;
        ELSIF p_activity = 'MOBILE' THEN
            -- Check mobile number length
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length <= 10 THEN
                -- Update mobile number
                UPDATE bank_details SET mobile = p_new_data WHERE account_no = p_account_no;
                p_message := 'Your mobile number updated successfully!';
                dbms_output.put_line(p_message);
            ELSE
                p_message := 'Enter a 10-digit mobile number.';
                dbms_output.put_line(p_message);
            END IF;
        
         ELSIF p_activity = 'ADHAR' THEN
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length = 12 THEN
                -- Update Adhar
                UPDATE bank_details 
                SET adhar = p_new_data 
                WHERE account_no = p_account_no;
                p_message := 'Your Adhar updated successfully!';
                dbms_output.put_line(p_message);
            ELSE
                p_message := 'Enter a 12-digit Adhar number.';
                dbms_output.put_line(p_message);
            END IF;
            
           ELSIF p_activity = 'PAN' THEN
            SELECT LENGTH(p_new_data) INTO v_length FROM DUAL;

            IF v_length = 10 THEN
                -- Update Pan
                UPDATE bank_details 
                SET pan = p_new_data 
                WHERE account_no = p_account_no;
                p_message := 'Your PAN updated successfully!';
                dbms_output.put_line(p_message);
            ELSE
                p_message := 'Enter a 10-digit PAN number.';
                dbms_output.put_line(p_message);
            END IF;
        ELSE
            p_message := 'Invalid activity specified!';
             dbms_output.put_line(p_message);
        END IF;
    ELSE
        p_message := 'Account number is invalid. Please try with a valid account number!';
        dbms_output.put_line(p_message);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        p_message := 'Due to some technical issue, the update was not successful. Please contact the IT department!';
         dbms_output.put_line(p_message);
END;
/

exec proc_bank(12345678901234567890,'123455885588','ADHAR');