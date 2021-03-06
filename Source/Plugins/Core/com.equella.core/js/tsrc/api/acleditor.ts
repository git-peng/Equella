
export interface TargetListEntry {
    granted: boolean;
    override: boolean;
    privilege: string;
    who: string;
}

export interface AclEditorChangeEvent {
    canSave: boolean;
    getAcls: () => TargetListEntry[];
}

export interface AclEditorProps {
    acls: TargetListEntry[];
    onChange: (e: AclEditorChangeEvent) => void;
    allowedPrivs: string[];
}