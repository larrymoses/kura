#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings

PageExtension 50031 "pageextension50031" extends "User Setup" 
{
    layout
    {
        addafter("User ID")
        {
            field(CIDO; Rec.CIDO)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Allow Posting To")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = Basic;
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = Basic;
            }
            field(Receiptionist; Rec.Receiptionist)
            {
                ApplicationArea = Basic;
            }
            field("Accounts User"; Rec."Accounts User")
            {
                ApplicationArea = Basic;
            }
            field("Accounts Administrator"; Rec."Accounts Administrator")
            {
                ApplicationArea =Basic;
            }
            field("SCM Administrator";Rec."SCM Administrator")
            {
                ApplicationArea =Basic;
            }
            field(Leave; Rec.Leave)
            {
                ApplicationArea = Basic;
            }
            field("Resource No"; Rec."Resource No")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Account"; Rec."Imprest Account")
            {
                ApplicationArea = Basic;
            }
            field("Payroll View"; Rec."Payroll View")
            {
                ApplicationArea = Basic;
            }
            field("Post Memo"; Rec."Post Memo")
            {
                ApplicationArea = Basic;
            }
            field("Post Requisition"; Rec."Post Requisition")
            {
                ApplicationArea = Basic;
            }
            field("Procurement officer"; Rec."Procurement officer")
            {
                ApplicationArea = Basic;
            }
            field("Procurement Manager"; Rec."Procurement Manager")
            {
                ApplicationArea = Basic;
            }
            field("post surrender"; Rec."post surrender")
            {
                ApplicationArea = Basic;
            }
            field("Allowed To Auto Reverse"; Rec."Allowed To Auto Reverse")
            {
                ApplicationArea = Basic;
            }
            field("Approval Administrator"; Rec."Approval Administrator")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Email)
        {
            field("Portal User"; Rec."Portal User")
            {
                ApplicationArea = Basic;
            }
            field("Create New Job"; Rec."Create New Job")
            {
                ApplicationArea = Basic;
            }
            field("Update Job Status"; Rec."Update Job Status")
            {
                ApplicationArea = Basic;
            }
            field("Archive Document"; Rec."Archive Document")
            {
                ApplicationArea = Basic;
            }
            field("Region Code"; Rec."Region Code")
            {
                ApplicationArea = Basic;
            }
            field("Authorize IFS Creator"; Rec."Authorize IFS Creator")
            {
                ApplicationArea = Basic;
            }
            field("Cancel Invitation For Supply"; Rec."Cancel Invitation For Supply")
            {
                ApplicationArea = Basic;
            }
            field("View AIE"; Rec."View AIE")
            {
                ApplicationArea = Basic;
            }
            field("View Imprest"; Rec."View Imprest")
            {
                ApplicationArea = Basic;
            }
            field("Road Planner No"; Rec."Road Planner No")
            {
                ApplicationArea = Basic;
            }
            field("Create Maintenance Budget Book"; Rec."Create Maintenance Budget Book")
            {
                ApplicationArea = Basic;
            }
            field("Create Development Budget Book"; Rec."Create Development Budget Book")
            {
                ApplicationArea = Basic;
            }
            field("Create Regional WorkPlan"; Rec."Create Regional WorkPlan")
            {
                ApplicationArea = Basic;
            }
            field("Create Constituency WorkPlan"; Rec."Create Constituency WorkPlan")
            {
                ApplicationArea = Basic;
            }
            field("AIE Creation & Posting"; Rec."AIE Creation & Posting")
            {
                ApplicationArea = Basic;
            }
            field("Principal Accountant"; Rec."Principal Accountant")
            {
                ApplicationArea = Basic;
            }
            field("Amend Bank Account Details"; Rec."Amend Bank Account Details")
            {
                ApplicationArea = Basic;
            }
            field("Unapply Entries"; Rec."Unapply Entries")
            {
                ApplicationArea = Basic;
            }
            field("Discount Bill"; Rec."Discount Bill")
            {
                ApplicationArea = Basic;
            }
            field("Ammend Vacancy Adverts"; Rec."Ammend Vacancy Adverts")
            {
                ApplicationArea = Basic;
            }
            field("View Appraisals"; Rec."View Appraisals")
            {
                ApplicationArea = Basic;
            }
            field("Access Retention Account"; Rec."Access Retention Account")
            {
                ApplicationArea = Basic;
            }
            field("Retention Donor"; Rec."Retention Donor")
            {
                ApplicationArea = Basic;
            }
            field("View Works Inspections"; Rec."View Works Inspections")
            {
                ApplicationArea = Basic;
            }
            field("View Lab Works Inspections"; Rec."View Lab Works Inspections")
            {
                ApplicationArea = Basic;
            }
            field("View Survey Works Inspections"; Rec."View Survey Works Inspections")
            {
                ApplicationArea = Basic;
            }
            field("Allow Create Road Links"; Rec."Allow Create Road Links")
            {
                ApplicationArea = Basic;
            }
            field("Allow Open My Settings";Rec."Allow Open My Settings")
            {
                ApplicationArea = Basic;
            }
            field("Allow Change Role";Rec."Allow Change Role")
            {
                ApplicationArea=Basic;
            }
            field("Allow Change Company";Rec."Allow Change Company")
            {
                ApplicationArea=Basic;
            }
            field("Allow Change Work Day";Rec."Allow Change Work Day")
            {
                ApplicationArea =Basic;
            }
            field("Allow Create Imprest"; Rec."Allow Create Imprest")
            {
                ApplicationArea = Basic;
            }
        }
    }



   
}



