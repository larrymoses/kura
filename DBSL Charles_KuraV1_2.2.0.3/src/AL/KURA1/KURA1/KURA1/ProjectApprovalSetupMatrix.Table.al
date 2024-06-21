#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72378 "Project Approval Setup Matrix"
{

    fields
    {
        field(1;"Project ID";Code[100])
        {
            
            Editable = false;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            
            Editable = false;
        }
        field(3;"Region Code";Code[40])
        {
            
            TableRelation = "Responsibility Center".Code where ("Assignment Area ID"=field("Assignment Area ID"),
                                                                "Operating Unit Type"=filter(Region));
        }
        field(4;"Region Name";Text[2048])
        {
            
            Editable = false;
        }
        field(5;"Document Type";Enum "Project Approval Doc Type")
        {
            
            Editable = true;
            // OptionCaption = ' ,Commenncement Order,Communication Plan,Staff Appointments,Internal Staff Disengement,Staff Disengagement,Mobilization Checklist,Mobilization Checklist Status Report,Professional Indemnity,Work Execution Plan,HSE Plan,RMP,QMP,Contract Supervision Requirement,Site Agent Nomination,Contractor Key Personnel Appointment,Equipment Delivery To Site,Insurance of Works,Advance Payment Guarantee,Performance Guarantee,Equipment Tracking';
            // OptionMembers = " ","Commenncement Order","Communication Plan","Staff Appointments","Internal Staff Disengement","Staff Disengagement","Mobilization Checklist","Mobilization Checklist Status Report","Professional Indemnity","Work Execution Plan","HSE Plan",RMP,QMP,"Contract Supervision Requirement","Site Agent Nomination","Contractor Key Personnel Appointment","Equipment Delivery To Site","Insurance of Works","Advance Payment Guarantee","Performance Guarantee","Equipment Tracking";
        }
        field(6;"Sequence No.";Integer)
        {
            
        }
        field(7;"Project Role Code";Code[100])
        {
            
            TableRelation = "Project Staff Role Code"."Staff Role Code" where ("Team Type"=filter("Internal Project Team"));
        }
        field(8;"Table ID";Integer)
        {
            
        }
        field(9;"Assignment Area ID";Code[100])
        {
            
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=filter("Duty Station"));
        }
        field(10;"Approver ID";Code[100])
        {
            
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset;
                UserSetup.SetRange(UserSetup."User ID","Approver ID");
                if UserSetup.FindSet then begin
                   "Employee No.":=UserSetup."Employee No.";
                    Validate("Employee No.");
                  end;
            end;
        }
        field(11;"Entry No.";Integer)
        {
            AutoIncrement = false;
            
            Editable = false;
        }
        field(12;"Employee No.";Code[20])
        {
            
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."No.","Employee No.");
                if Employee.FindSet then begin
                   Employee.TestField("Company E-Mail");
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  "Employee Email":=Employee."Company E-Mail";
                  end;
            end;
        }
        field(13;"Employee Name";Text[2048])
        {
            
            Editable = false;
        }
        field(14;"Employee Email";Text[250])
        {
            
            Editable = false;
        }
        field(15; Delegation; Boolean)
        {
            
        }
    }

    keys
    {
        key(Key1;"Project ID","Document Type","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Table ID":=72373;
        ObjJob.Reset;
        ObjJob.SetRange(ObjJob."No.","Project ID");
        if ObjJob.FindSet then
          begin
            //ObjJob.TestField("Assignment Area ID");
            "Assignment Area ID":=ObjJob."Assignment Area ID";
            Validate("Assignment Area ID");
            end;
    end;

    var
        ProjectTemplateHeader: Record "Project Template Header";
        Employee: Record Employee;
        UserSetup: Record "User Setup";
        ObjJob: Record Job;
}

