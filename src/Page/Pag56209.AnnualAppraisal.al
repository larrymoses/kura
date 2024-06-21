#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Page 56209 "Annual Appraisal"
{
    PageType = Card;
    SourceTable = "Annual Appraisal";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field("Date created";"Date created")
                {
                    ApplicationArea = Basic;
                }
                field("Time Created";"Time Created")
                {
                    ApplicationArea = Basic;
                }
                field("Created By";"Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No";"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name";"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code";"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code";"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year";"Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Quartely score";"Overall Quartely score")
                {
                    ApplicationArea = Basic;
                }
                field("Current Designation";"Current Designation")
                {
                    ApplicationArea = Basic;
                }
                field("Terms of service";"Terms of service")
                {
                    ApplicationArea = Basic;
                }
                field("Acting Appointment";"Acting Appointment")
                {
                    ApplicationArea = Basic;
                }
                field("Additional Assignment";ObjText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CalcFields("Additional Assignment");
                        "Additional Assignment".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText<>Format(Obj) then
                        begin
                         Clear("Additional Assignment");
                         Clear(Obj);
                         Obj.AddText(ObjText);
                         "Additional Assignment".CreateOutstream(ObjOutStr);
                         Obj.Write(ObjOutStr);
                         //MODIFY;
                        end;
                    end;
                }
                field(Remarks;ObjText2)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        CalcFields(Remarks);
                        Remarks.CreateInstream(ObjInstr2);
                        Obj2.Read(ObjInstr2);

                        if ObjText2<>Format(Obj2) then
                        begin
                         Clear(Remarks);
                         Clear(Obj2);
                         Obj2.AddText(ObjText2);
                         Remarks.CreateOutstream(ObjOutStr2);
                         Obj2.Write(ObjOutStr2);
                         //MODIFY;
                        end;
                    end;
                }
                field("Supervisor Code";"Supervisor Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Name";"Supervisor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Supervisor Designation";"Supervisor Designation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control22;"Annual Appraisal Lines")
            {
                SubPageLink = "Appraisal No"=field(No);
            }
            part(Control28;"Training & Development Needs")
            {
                SubPageLink = "Appraisal No"=field(No);
            }
            part("Mid-Year Review";"Mid-Year Review")
            {
                SubPageLink = "Appraisal No"=field(No);
            }
        }
        area(factboxes)
        {
            systempart(Control21;Notes)
            {
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send to the Supervisor")
            {
                ApplicationArea = Basic;
                Image = SendElectronicDocument;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Status := Status::"Sent to supervisior";
                    Modify;
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    SetRange(No,No);
                    Report.Run(56205,true,true,Rec)
                end;
            }
        }
    }

    var
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Obj2: BigText;
        ObjInstr2: InStream;
        ObjOutStr2: OutStream;
        ObjText2: Text;
}

