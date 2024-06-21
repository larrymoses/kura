#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72232 "WEP Project Stakeholder"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Order-To-Commence,Work Execution Programme';
            OptionMembers = " ","Order-To-Commence","Work Execution Programme";
        }
        field(2;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Stakeholder ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Stakeholder.Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ProjectMobilizationHeader.Reset;
                ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document Type","Document Type");
                ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.","Document No.");
                if ProjectMobilizationHeader.FindSet then begin
                  Description:=ProjectMobilizationHeader.Description;
                  "Communication Plan ID":=ProjectMobilizationHeader."Communication Plan ID";
                  end;
            end;
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Stakeholder Power Level (P)";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Low,High';
            OptionMembers = " ",Low,High;
        }
        field(6;"Stakeholder Interest Level (I)";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Stakeholder Int. Level (I)';
            OptionCaption = ' ,Low,High';
            OptionMembers = " ",Low,High;
        }
        field(7;"Management Strategy (MS)";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Monitor, Keep Informed, Keep Satisfied, Manage Closely';
            OptionMembers = " ",Monitor," Keep Informed"," Keep Satisfied"," Manage Closely";
        }
        field(8;"No. of S/Holder Power Entries";Integer)
        {
            CalcFormula = count("WEP Project Stakeholder Grid" where ("Stakeholder ID"=field("Stakeholder ID"),
                                                                      "Line Type"=filter("Power/Influence")));
            Caption = 'No. of Stakeholder Power/Influence Entries';
            Description = 'No. of Stakeholder Power/Influence Entries';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"No. of S/Holder Int. Entries";Integer)
        {
            CalcFormula = count("WEP Project Stakeholder Grid" where ("Stakeholder ID"=field("Stakeholder ID"),
                                                                      "Line Type"=filter("Interest & Expectations")));
            Caption = 'No. of Stakeholder Interests & Expectation Entries';
            Description = 'No. of Stakeholder Interests & Expectation Entries';
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"No. of Stakeholder Rights";Integer)
        {
            CalcFormula = count("WEP Project Stakeholder Grid" where ("Stakeholder ID"=field("Stakeholder ID"),
                                                                      "Line Type"=filter(Rights)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11;"No. Of Planned S/Holder Mgt In";Integer)
        {
            CalcFormula = count("WEP Project Stakeholder Grid" where ("Stakeholder ID"=field("Stakeholder ID"),
                                                                      "Line Type"=filter("Key Initiatives")));
            Caption = 'No. of Planned Stakeholder Management Initiatives';
            Description = 'No. of Planned Stakeholder Management Initiatives';
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"Project Role Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Staff Role Code"."Staff Role Code" where (Blocked=filter(false));
        }
        field(13;"Communication Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Communication Plan Header"."Document No" where ("Document Type"=field("Document Type"),
                                                                             "Document No"=field("Document No."));
        }
        field(14;"No. Of Planned Comm. Types";Integer)
        {
            CalcFormula = count("Comm Plan Line Stakeholder" where ("Stakeholder ID"=field("Stakeholder ID")));
            Caption = 'No. of Planned Communication Types';
            Description = 'No. of Planned Communication Types';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No.","Stakeholder ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProjectMobilizationHeader: Record "Project Mobilization Header";
}

