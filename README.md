# Parse JSON to CSV format

I have used a complex json from Xero's Bank Transaction API to demonstrate this. The source of that json is with some modifications:

https://developer.xero.com/documentation/api/accounting/banktransactions#post-banktransactions


The goal is to take each individual line item and return it in a csv of format:

```csv
LineItemId,AccountCode,Description,LineAmount,BankAccountName,Reference
```

## Usage
```
ruby main.rb > output.csv
```


### Return csv

```csv
LineItemId,AccountCode,Description,LineAmount,BankAccountName,Reference
52208ff9-528a-4985-a9ad-b2b1d4210e38,404,Monthly account fee,49.90
f6dfa72d-f9e8-468d-a0cc-ec3290d40579,433,Software Services,229.90
e5220c9c-aa1f-4fa1-9b20-2ba0a2c277b8,4344,Coffee,33.00
9184901b-9cc4-4153-ad56-db732b404ea8,404,Monthly account fee,339.90
2d65cf27-5ce8-400f-bb9d-cad56ba93aaf,433,Software Services,209.90
863ae488-0a10-43e5-8794-4337585be5b1,4344,Coffee,23.00
```


### Input JSON

```json
{
  "BankTransactions": [
    {
      "Contact": {
        "ContactID": "6d42f03b-181f-43e3-93fb-2025c012de92",
        "Name": "Wilson Periodicals"
      },
      "DateString": "2014-05-26T00:00:00",
      "Date": "\/Date(1401062400000+0000)\/",
      "Status": "AUTHORISED",
      "LineAmountTypes": "Inclusive",
      "LineItems": [
        {
          "Description": "Monthly account fee",
          "UnitAmount": "49.90",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "49.90",
          "AccountCode": "404",
          "Quantity": "1.0000",
          "LineItemID": "52208ff9-528a-4985-a9ad-b2b1d4210e38"
        },
        {
          "Description": "Software Services",
          "UnitAmount": "229.90",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "229.90",
          "AccountCode": "433",
          "Quantity": "1.0000",
          "LineItemID": "f6dfa72d-f9e8-468d-a0cc-ec3290d40579"
        },
        {
          "Description": "Coffee",
          "UnitAmount": "33.00",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "33.00",
          "AccountCode": "4344",
          "Quantity": "3.0000",
          "LineItemID": "e5220c9c-aa1f-4fa1-9b20-2ba0a2c277b8"
        }
      ],
      "SubTotal": "49.90",
      "TotalTax": "0.00",
      "Total": "49.90",
      "UpdatedDateUTC": "\/Date(1439434356790+0000)\/",
      "CurrencyCode": "NZD",
      "BankTransactionID": "d20b6c54-7f5d-4ce6-ab83-55f609719126",
      "BankAccount": {
        "AccountID": "ac993f75-035b-433c-82e0-7b7a2d40802c",
        "Code": "090",
        "Name": "Business Bank Account"
      },
      "BatchPayment": {
        "Account": {
          "AccountID": "ac993f75-035b-433c-82e0-7b7a2d40802c"
        },
        "BatchPaymentID": "b54aa50c-794c-461b-89d1-846e1b84d9c0",
        "Date": "\/Date(1401062400000+0000)\/",
        "Type": "RECBATCH",
        "Status": "AUTHORISED",
        "TotalAmount": "100.00",
        "UpdatedDateUTC": "\/Date(1439434356790+0000)\/",
        "IsReconciled": "true"
      },
      "Type": "SPEND",
      "Reference": "Sub 098801",
      "IsReconciled": "true"
    },
    {
      "Contact": {
        "ContactID": "c659bb76-1945-48ff-b230-bff650fbb5ac",
        "Name": "New York Times"
      },
      "DateString": "2014-05-26T00:00:00",
      "Date": "\/Date(1401062400000+0000)\/",
      "Status": "AUTHORISED",
      "LineAmountTypes": "Inclusive",
      "LineItems": [
        {
          "Description": "Monthly account fee",
          "UnitAmount": "339.90",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "339.90",
          "AccountCode": "404",
          "Quantity": "1.0000",
          "LineItemID": "9184901b-9cc4-4153-ad56-db732b404ea8"
        },
        {
          "Description": "Software Services",
          "UnitAmount": "209.90",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "209.90",
          "AccountCode": "433",
          "Quantity": "1.0000",
          "LineItemID": "2d65cf27-5ce8-400f-bb9d-cad56ba93aaf"
        },
        {
          "Description": "Coffee",
          "UnitAmount": "23.00",
          "TaxType": "NONE",
          "TaxAmount": "0.00",
          "LineAmount": "23.00",
          "AccountCode": "4344",
          "Quantity": "3.0000",
          "LineItemID": "863ae488-0a10-43e5-8794-4337585be5b1"
        }
      ],
      "SubTotal": "49.90",
      "TotalTax": "0.00",
      "Total": "49.90",
      "UpdatedDateUTC": "\/Date(1439434356790+0000)\/",
      "CurrencyCode": "NZD",
      "BankTransactionID": "0a23df5a-ab2f-4327-b3da-07acfce39f8d",
      "BankAccount": {
        "AccountID": "ac993f75-035b-433c-82e0-7b7a2d40802c",
        "Code": "090",
        "Name": "Business Bank Account"
      },
      "BatchPayment": {
        "Account": {
          "AccountID": "ac993f75-035b-433c-82e0-7b7a2d40802c"
        },
        "BatchPaymentID": "b54aa50c-794c-461b-89d1-846e1b84d9c0",
        "Date": "\/Date(1401062400000+0000)\/",
        "Type": "RECBATCH",
        "Status": "AUTHORISED",
        "TotalAmount": "100.00",
        "UpdatedDateUTC": "\/Date(1439434356790+0000)\/",
        "IsReconciled": "true"
      },
      "Type": "SPEND",
      "Reference": "Sub 098801",
      "IsReconciled": "true"
    }
  ]
}
```
