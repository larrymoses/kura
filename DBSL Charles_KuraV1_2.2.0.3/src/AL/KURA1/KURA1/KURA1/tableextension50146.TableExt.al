#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50146 "tableextension50146" extends "Service Cue" 
{
    fields
    {
        field(50000;"Imprest Requisition-Aproved";Integer)
        {
            CalcFormula = count(payments where (Status=const(Released),
                                                "Document Type"=filter(Imprest),
                                                "Created By"=field("User ID Filter")));
            FieldClass = FlowField;
        }
        field(50001;"Imprest Memo-Approved";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50002;"Imprest Surender-Approved";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Imprest Request-P";Integer)
        {
            CalcFormula = count(payments where (Status=const(Released),
                                                Posted=const(true),
                                                "Document Type"=filter(Imprest),
                                                "Created By"=field("User ID Filter")));
            FieldClass = FlowField;
        }
        field(50004;"Imprest Request-Inprocess";Integer)
        {
            CalcFormula = count(payments where (Status=filter(Open|"Pending Approval"),
                                                "Document Type"=filter(Imprest),
                                                "Created By"=field("User ID Filter")));
            FieldClass = FlowField;
        }
        field(50005;"Imprest Surrender-P";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50006;"Imprest Surender-Inprocess";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50007;"Imprest memo-P";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50008;"Imprest Memo-inprocess";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50009;"Imprest memo surr-inprocess";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50010;"Imprest memo Surr-A";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50011;"Imprest memo Surr-p";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(50012;"Leave Application-Inprocess";Integer)
        {
            CalcFormula = count("HR Leave Applications" where (Status=filter(Open|"Pending Approval")));
            FieldClass = FlowField;
        }
        field(50013;"Leave Application-Approved";Integer)
        {
            CalcFormula = count("HR Leave Applications" where (Status=const(Rejected)));
            FieldClass = FlowField;
        }
        field(50015;"Requests to Approve";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Approver ID"=field("User ID Filter"),
                                                        Status=const(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(50016;"Requests Sent for Approval";Integer)
        {
            CalcFormula = count("Approval Entry" where ("Sender ID"=field("User ID Filter"),
                                                        Status=filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
    }
}

