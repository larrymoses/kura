#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 95100 "Risk Management Framework"
{

    fields
    {
        field(1;"Primary Key";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"External Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Organization Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Primary Purpose";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Overall Responsibility";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where (Blocked=filter(false));
        }
        field(7;"Last Revision Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Default Risk LR Scale ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Risk Likelihood Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Likelihood Rating"),
                                                                         Blocked=filter(false));
        }
        field(9;"Default Risk Impact R. Scale";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Risk Impact Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Impact Rating"),
                                                                         Blocked=filter(false));
        }
        field(10;"Default Overall RR Scale ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Overall Risk Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Overall Risk Rating"),
                                                                         Blocked=filter(false));
        }
        field(11;"Default Risk AR Scale ID";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Default Risk Appetite Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where ("Risk Rating Scale Type"=filter("Risk Appetite Rating"),
                                                                         Blocked=filter(false));
        }
        field(12;"No. Of Risk Mgt Plans";Integer)
        {
            CalcFormula = count("Risk Management Plan");
            Description = 'No. of Risk Management Plans';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;"Corporate Risk Mgt Plan Nos.";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Corporate Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(14;"Functional Risk Mgt Plan Nos.";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Functional Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(15;"Project Risk Mgt Plan Nos.";Code[50])
        {
            DataClassification = ToBeClassified;
            Description = 'Project Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(16;"Directorate Risk Mgt Plan Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Directorate Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(17;"Departmenta Risk Mgt Plan Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Depart Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(18;"Regional Risk Mgt Plan Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Regional Risk Mgt Plan Nos.';
            TableRelation = "No. Series";
        }
        field(19;"Risk Incident Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Risk Incident Nos.';
            TableRelation = "No. Series";
        }
        field(20;"No. of New Risk Vouchers";Integer)
        {
            CalcFormula = count("Risk M&E Header" where ("Document Type"=filter("New Risk Voucher")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(21;"No. of Risk Status Reports";Integer)
        {
            CalcFormula = count("Risk M&E Header" where ("Document Type"=filter("Risk Status Report")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(22;"No. Of Risk Incident Reports";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;"No. Of Posted Incident Reports";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(24;"No. Of Annual Audit Plans";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25;"No. Of Planned Audit Projects";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"No. Of Ongoing Audit Projects";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27;"No. Of Completed Audit Project";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28;"No. Of Audit Commnce Orders";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29;"No. Of Audit Entry Meetings";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30;"No. Of Audit Field Works";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31;"No. Of Draft Audit Reports";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32;"No. Of Final Audit Reports";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33;"No. Of Audit Exit Meetings";Integer)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(34;"New Risk Voucher Nos";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(35;"Status Report Nos";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(36;"Default UoM (Financial Loss)";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(37;"Default UoM (Persons Injured)";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(38;"Default UoM (Fatalities)";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(39;"Default UoM Duration of Delays";Code[20])
        {
            Caption = 'Default UoM (Duration of Delays/Service disruption)';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
    }

    keys
    {
        key(Key1;"Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

