/*
 * Created on Aug 17, 2005
 */
package com.tle.core.workflow.migrate.beans.node;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import org.hibernate.annotations.AccessType;

import com.tle.beans.entity.LanguageBundle;

@Entity(name = "WorkflowSerial")
@AccessType("field")
@DiscriminatorValue("s")
public class FakeSerialNode extends FakeWorkflowNode
{
	private static final long serialVersionUID = 1;

	public FakeSerialNode(LanguageBundle name)
	{
		super(name);
	}

	public FakeSerialNode()
	{
		super();
	}

	@Override
	public char getType()
	{
		return 's';
	}

	@Override
	public boolean canHaveSiblingRejectPoints()
	{
		return true;
	}
}
