/*
 * Created on 6/12/2005
 */
package com.tle.common.settings.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface PropertyList
{
	String key();

	Class<?> type() default String.class;
}
