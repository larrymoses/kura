#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AW0006 // ForNAV settings
Table 72246 "Daily Work Record Meeting"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Meeting Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Meeting Type".Code where (Blocked=filter(false));

            trigger OnValidate()
            begin
                ProjectMeetingType.Reset;
                ProjectMeetingType.SetRange(ProjectMeetingType.Code,"Meeting Type");
                if ProjectMeetingType.FindSet then begin
                   Description:=ProjectMeetingType.Description+' - '+"Project ID";
                  end;


                ProjectMeetingAgendaTemp.Reset;
                ProjectMeetingAgendaTemp.SetRange(ProjectMeetingAgendaTemp."Project Meeting Type","Meeting Type");
                if ProjectMeetingAgendaTemp.FindSet then begin
                   repeat
                     DWRMeetingAgenda.Init;
                     DWRMeetingAgenda."Document No.":="Document No.";
                     DWRMeetingAgenda."Line No.":="Line No.";
                     DWRMeetingAgenda."Agenda Code":=ProjectMeetingAgendaTemp."Agenda Code";
                     DWRMeetingAgenda."Agenda Description":=ProjectMeetingAgendaTemp."Agenda Description";
                     DWRMeetingAgenda.Owner:=ProjectMeetingAgendaTemp.Owner;
                     DWRMeetingAgenda."Estimate Time (Minutes)":=ProjectMeetingAgendaTemp."Estimate Time (Minutes)";
                     if not DWRMeetingAgenda.Insert(true) then
                       DWRMeetingAgenda.Modify(true);
                   until ProjectMeetingAgendaTemp.Next=0;
                  end;


                MeetingAgendaItemTemplate.Reset;
                MeetingAgendaItemTemplate.SetRange(MeetingAgendaItemTemplate."Project Meeting Type","Meeting Type");
                if MeetingAgendaItemTemplate.FindSet then begin
                  repeat
                    DWRMeetingSummary.Init;
                    DWRMeetingSummary."Document No.":="Document No.";
                    DWRMeetingSummary."Line No.":="Line No.";
                    DWRMeetingSummary."Agenda Code":=MeetingAgendaItemTemplate."Agenda Code";
                    DWRMeetingSummary."Agenda Item No.":=MeetingAgendaItemTemplate."Item Code";
                    DWRMeetingSummary."Item Discussed":=MeetingAgendaItemTemplate.Description;
                    if not DWRMeetingSummary.Insert(true) then
                      DWRMeetingSummary.Modify(true);
                    until MeetingAgendaItemTemplate.Next=0;
                  end;
            end;
        }
        field(4;"Project ID";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Daily Work Record"."Project ID";
        }
        field(5;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Project Name";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Meeting Organizer ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));
        }
        field(8;"All Day Event";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Start Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Duration(Days)";DateFormula)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "End Date":=CalcDate("Duration(Days)","Start Date");
            end;
        }
        field(12;"End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Venue/Location";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Meeting Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Planned,Completed,Cancelled';
            OptionMembers = " ",Planned,Completed,Cancelled;
        }
    }

    keys
    {
        key(Key1;"Document No.","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         DailyWorkRecord.Reset;
         DailyWorkRecord.SetRange(DailyWorkRecord."Document No.","Document No.");
         if DailyWorkRecord.FindSet then
          begin

            "Project ID":=DailyWorkRecord."Project ID";
            ObjJob.Reset;
            ObjJob.SetRange(ObjJob."No.","Project ID");
            if ObjJob.FindSet then
            "Project Name":=ObjJob.Description;
          end;
    end;

    var
        ObjJob: Record Job;
        ProjectMeetingType: Record "Project Meeting Type";
        DailyWorkRecord: Record "Daily Work Record";
        ProjectMeetingAgendaTemp: Record "Project Meeting Agenda Temp";
        DWRMeetingAgenda: Record "DWR Meeting Agenda";
        ProjectMeetingAgenda: Record "Project Meeting Agenda";
        MeetingAgendaItemTemplate: Record "Meeting Agenda Item Template";
        DWRMeetingSummary: Record "DWR Meeting Summary";
}

