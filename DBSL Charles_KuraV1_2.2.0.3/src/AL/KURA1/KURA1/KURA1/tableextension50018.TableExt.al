#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
TableExtension 50018 "tableextension50018" extends "User Setup"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Salespers./Purch. Code"(Field 10)".

        field(50000; "Membership Approver"; Boolean)
        {
        }
        field(50001; "Global Dimension 1 Code"; Code[50])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(50002; "Accounts Approver"; Boolean)
        {
        }
        field(50003; Pictures; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(50004; "Unlimited Imprest Amt Approval"; Boolean)
        {
        }
        field(50005; "Imprest Amount Approval Limit"; Decimal)
        {
        }
        field(50006; "Unlimited Store RqAmt Approval"; Boolean)
        {
        }
        field(50007; "Store Req. Amt Approval Limit"; Decimal)
        {
        }
        field(50009; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(50010; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50011; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(50012; "Unlimited ImprestSurr Amt Appr"; Boolean)
        {
        }
        field(50013; "ImprestSurr Amt Approval Limit"; Decimal)
        {
        }
        field(50014; "Unlimited Interbank Amt Appr"; Boolean)
        {
        }
        field(50015; "Interbank Amt Approval Limit"; Decimal)
        {
        }
        field(50016; "Imprest Account"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(50017; UserName; Text[30])
        {
        }
        field(50018; Approvername; Text[30])
        {
        }
        field(50019; Approvermail; Text[30])
        {
        }
        field(50020; "Staff No"; Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                /*IF Staff.GET("Staff No")THEN BEGIN
                UserName:=Staff."First Name"+' '+Staff."Middle Name"+' '+Staff."Last Name";
                "E-Mail":=Staff."Company E-Mail";
                "Global Dimension 1 Code":=Staff."HR Department Name";
                "Job Tittle":=Staff."Job Title";
                END
                */

            end;
        }
        field(50021; "Job Tittle"; Text[100])
        {
        }
        field(50022; "Vote User"; Boolean)
        {
        }
        field(50023; Designation; Text[50])
        {
        }
        field(50024; "Allowed To Auto Reverse"; Boolean)
        {
        }
        field(50025; "User Signature"; Blob)
        {
            SubType = Memo;
        }
        field(50026; "Store Requisitioner"; Boolean)
        {
        }
        field(50027; "PV Amount Approval Limit"; Decimal)
        {
        }
        field(50028; "Unlimited PettyAmount Approval"; Boolean)
        {
        }
        field(50029; "Petty C Amount Approval Limit"; Decimal)
        {
        }
        field(50030; "Unlimited PV Amount Approval"; Boolean)
        {
        }
        field(57000; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Get("Employee No.");
                "Employee Name" := Emp."First Name" + ' ' + Emp."Last Name";
                //Modify;
            end;
        }
        field(57001; Picture; Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(57003; "Employee Name"; Text[100])
        {
            Editable = false;
        }
        field(57006; "Responsibility Center"; Code[10])
        {
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }
        field(59000; "Create New Job"; Boolean)
        {
            Description = '//Restrict Job creation...Ushindi';
        }
        field(59001; "Update Job Status"; Boolean)
        {
            Description = '//Restrict Job modification...Ushindi';
        }
        field(59002; "Resource No"; Code[20])
        {
            Description = '//Link Resource Code Mapping...Ushindi';
            TableRelation = Resource where(Type = filter(Person));
        }
        field(59015; "Payroll View"; Boolean)
        {
        }
        field(59016; "Post Memo"; Boolean)
        {
        }
        field(59017; "post surrender"; Boolean)
        {
        }
        field(59018; "Post Requisition"; Boolean)
        {
        }
        field(59019; "Accounts User"; Boolean)
        {
            Description = 'Restrict documents view';
        }
        field(59020; "Post Receipts"; Boolean)
        {
        }
        field(59021; "Lock Imprests"; Boolean)
        {
        }
        field(59022; "Procurement officer"; Boolean)
        {
        }
        field(59023; Leave; Boolean)
        {
        }
        field(59024; "Reopen Document"; Boolean)
        {
        }
        field(59025; "Process Claims"; Boolean)
        {
        }
        field(59026; Receiptionist; Boolean)
        {
        }
        field(59027; "Procurement Manager"; Boolean)
        {
            
        }
        field(59028; CIDO; Boolean)
        {
            
        }
        field(59029; "Portal User"; Boolean)
        {
            
        }
        field(59030; Projects; Boolean)
        {
            
        }
        field(59031; "Archive Document"; Boolean)
        {
            
        }
        field(59032; "Original Approver ID"; Code[50])
        {
            
        }
        field(59033; "From Date"; Date)
        {
            
        }
        field(59034; "To Date"; Date)
        {
            
        }
        field(59035; "Relieved Approver"; Code[50])
        {
            
        }
        field(59036; "Delegation Nos"; Code[20])
        {
            
            TableRelation = "No. Series";
        }
        field(59037; "Region Code"; Code[100])
        {
            
            TableRelation = "Responsibility Center".Code;
        }
        field(70000; "Cancel Invitation For Supply"; Boolean)
        {
            
            Description = 'Authorized to Cancel Invitation For Supply)';
        }
        field(70001; "Authorize IFS Creator"; Boolean)
        {
            
        }
        field(70002; "View AIE"; Boolean)
        {
            
        }
        field(70003; "View Imprest"; Boolean)
        {
            
        }
        field(70004; "Road Planner No"; Code[20])
        {
            
            TableRelation = Resource."No." where(Type = filter(Person),
                                                   Blocked = filter(false),
                                                   "Road Planner" = filter(true));
        }
        field(70005; "Create Maintenance Budget Book"; Boolean)
        {
            
        }
        field(70006; "Create Development Budget Book"; Boolean)
        {
            
        }
        field(70007; "Create Regional WorkPlan"; Boolean)
        {
            
        }
        field(70008; "Create Constituency WorkPlan"; Boolean)
        {
            
        }
        field(70009; BlobField; Blob)
        {
            
            SubType = Memo;
        }
        field(70010; "Amend Bank Account Details"; Boolean)
        {
            
        }
        field(70011; "AIE Creation & Posting"; Boolean)
        {
            
        }
        field(70012; "Principal Accountant"; Boolean)
        {
            
        }
        field(70013; "Discount Bill"; Boolean)
        {
            
        }
        field(70014; "Ammend Vacancy Adverts"; Boolean)
        {
            
        }
        field(70015; "Access Retention Account"; Boolean)
        {
            
        }
        field(70016; "Retention Donor"; Code[20])
        {
            
            TableRelation = "Dimension Value".Code where("Dimension Code" = filter('DONOR'));
        }
        field(70017; "View Appraisals"; Boolean)
        {
            
        }
        field(70018; "View Works Inspections"; Boolean)
        {
            
        }
        field(70019; "View Lab Works Inspections"; Boolean)
        {
            
        }
        field(70020; "View Survey Works Inspections"; Boolean)
        {
            
        }
        field(70021; "Create Studies/Survey Budget"; Boolean)
        {
            
        }
        field(70022; "Unapply Entries"; Boolean)
        {
            
        }
        field(70023; "Substitute Selected"; Boolean)
        {
            
        }
        field(70024; "Selected Substitute"; Code[50])
        {
            
        }
        field(70025; "Allow Create Road Links"; Boolean)
        {
            
        }
        field(70026; WorkStation; Text[50])
        {
            CalcFormula = lookup(Employee.Workstation where("No." = field("Employee No.")));
            FieldClass = FlowField;
        }
        field(70027; "Accounts Administrator"; Boolean)
        {
            
        }
         field(70028; "Allow Open My Settings"; Boolean)
        {
            Caption = 'Allow Open My Settings';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(70029;"Allow Change Role" ; Boolean)
        {
            Caption = 'Allow Change Role';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(70030; "Allow Change Company"; Boolean)
        {
            Caption = 'Allow Change Company';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(70031; "Allow Change Work Day"; Boolean)
        {
            Caption = 'Allow Change Work Day';
            DataClassification = EndUserIdentifiableInformation;
        }
        field(70032; "Allow Create Imprest"; Boolean)
        {
            DataClassification = EndUserIdentifiableInformation;
        }
        field(70033; "SCM Administrator"; Boolean)
        {
            DataClassification = EndUserIdentifiableInformation;
        }
    }


  

    var
        Emp: Record Employee;
}

