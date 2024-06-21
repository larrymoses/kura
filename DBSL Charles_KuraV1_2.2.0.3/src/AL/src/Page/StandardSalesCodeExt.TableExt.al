tableextension 50073 StandardSalesCodeExt extends "Standard Sales Code"
{
    fields
    {
        field(50000; "Method of Disposal"; Option)
        {
            Caption = 'Method of Disposal';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = "Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
        }
        field(50001; "Disposal Type"; Code[50])
        {
            Caption = 'Disposal Type';
            DataClassification = ToBeClassified;
        }
        field(50002; "External Document No"; Code[100])
        {
            Caption = 'External Document No';
            DataClassification = ToBeClassified;
        }
        field(50003; "Project ID"; Code[100])
        {
            Caption = 'Project ID';
            DataClassification = ToBeClassified;
        }
        field(50004; "Assigned Procurement Officer"; Code[100])
        {
            Caption = 'Assigned Procurement Officer';
            DataClassification = ToBeClassified;
        }
        field(50005; "Requesting Directorate"; Code[100])
        {
            Caption = 'Requesting Directorate';
            DataClassification = ToBeClassified;
        }
        field(50006; "Requesting Department"; Code[100])
        {
            Caption = 'Requesting Department';
            DataClassification = ToBeClassified;
        }
        field(50007; "Tender Name"; Text[100])
        {
            Caption = 'Tender Name';
            DataClassification = ToBeClassified;
        }
        field(50008; "Tender Summary"; Text[100])
        {
            Caption = 'Tender Summary';
            DataClassification = ToBeClassified;
        }
        field(50009; "Status"; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionCaption = ',Open,Pending Approval,Approved,Disposed,Released';
            OptionMembers = "Open","Pending Approval","Approved","Disposed","Released";
        }
        field(50010; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(50011; "Disposal Requisition No"; code[50])
        {
            Caption = 'Disposal Requisition No';
            DataClassification = ToBeClassified;
        }
        field(50013; "Disposal  Plan ID"; code[50])
        {
            Caption = '}Disposal  Plan ID';
            DataClassification = ToBeClassified;
        }
        field(50014; "Created Date/Time"; DateTime)
        {
            Caption = 'Created Date/Time';
            DataClassification = ToBeClassified;
        }
        field(50015; "Created By"; Code[50])
        {
            Caption = 'Created By';
            DataClassification = ToBeClassified;
        }
        field(50016; "Cancel Reason Code"; Code[50])
        {
            Caption = 'Cancel Reason Code ';
            DataClassification = ToBeClassified;
        }
        field(50017; "Location Code"; Code[50])
        {
            Caption = 'Location Code';
            DataClassification = ToBeClassified;
        }
        field(50018; "Cancellation Date"; Date)
        {
            Caption = 'Cancellation Date';
            DataClassification = ToBeClassified;
        }
        field(50019; "Cancellation Secret Code"; code[80])
        {
            Caption = 'Cancellation Secret Code';
            DataClassification = ToBeClassified;
        }
        field(50020; "No. of Submission"; code[80])
        {
            Caption = 'No. of Submission';
            DataClassification = ToBeClassified;
        }

    }
}
