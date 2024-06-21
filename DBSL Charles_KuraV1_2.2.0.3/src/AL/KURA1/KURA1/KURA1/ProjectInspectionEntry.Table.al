#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72273 "Project Inspection Entry"
{

    fields
    {
        field(1;"Inspection No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Inspection Type";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,TakeOver Inspection,Post DLP Inspection';
            OptionMembers = " ","TakeOver Inspection","Post DLP Inspection";
        }
        field(3;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where (Status=filter("Completed/Under DLP"));
        }
        field(4;"Contract ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Contractor Request No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Inspection Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Contractor No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Contractor Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Committee No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"DLP Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"DLP Period";DateFormula)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"DLP End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Awarded Tender Sum Inc Tax";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Payments To Date";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(17;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(18;"Committee Decision";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Accept,Reject';
            OptionMembers = " ",Accept,Reject;
        }
        field(19;"Created By";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Created DateTime";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Works Start Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Works End Chainage";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Primary Contractor Rep.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Primary Contractor Rep.';
        }
        field(24;"Contractor Representative Role";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Contractor Rep. Email";Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Contractor Rep. Email';
        }
        field(26;"Work Execution Plan 1D";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Work Execution Programme"));
        }
        field(27;"Commencement Order No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Mobilization Header"."Document No." where ("Document Type"=filter("Order-To-Commence"));
        }
        field(28;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Project Manager/Engineer";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Region ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter(Region));
        }
        field(34;"Directorate ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(35;"Department ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(36;"Constituency ID";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = '"Responsibility Center".Code WHERE (Operating Unit Type=FILTER(Region))';
        }
        field(37;"Funding Agency No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Inventory"."Road Code" where (Blocked=filter(false));
        }
        field(39;"Road Section No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Section"."Road Section No.";
        }
        field(40;"Section Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(41;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Inspection No","Inspection Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RoadManagementSetup: Record "Road Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

